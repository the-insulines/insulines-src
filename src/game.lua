--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "game", package.seeall )

currentScene = nil

camera = MOAICamera2D.new ()

cameraDeltaX = 0
cameraDeltaY = 0

defaultFont = resource_cache.get ( "dialog_font" )

autoFollow = true

gameRunning = true

function game:loadScene ( scene )
  MOAIRenderMgr.clearRenderStack ()
  -- Cache scene
  self.currentScene = scene

  if scene.hud then
    -- Load HUD
    self:displayHUD ()
  end
  
  
  if not scene.initialized then
    -- Initialize scene
    scene:initialize ()
  else
    -- Reset scene
    scene:resetCamera ()
    scene:resetCharacter ()
  end
  
  -- Load all layers
  local renderTable = {}
  
  for k, layer in pairs( scene:layers() ) do 
    layer:setViewport ( viewport )
    layer:setCamera ( self.camera )
  
    if scene.fadeOnChange then
      layer:setColor(0,0,0,0)
    end
  
    table.insert(renderTable, layer)
  end
  
  -- Get Render Table
  local currentRenderTable = MOAIRenderMgr.getRenderTable ()
  
  -- Append layers to future render table
  if not currentRenderTable then currentRenderTable = {} end
  for k, layer in pairs ( currentRenderTable ) do
    table.insert(renderTable, layer)
  end
  MOAIRenderMgr.setRenderTable ( renderTable )
  
  if scene.fadeOnChange then
    performWithDelay ( 50, scene.fadeIn, 1, scene)
  end
end


function initialize ( self )
  -- Setup viewport
  viewport = MOAIViewport.new ()
  viewport:setSize ( SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )
  viewport:setScale ( WORLD_RESOLUTION_X, WORLD_RESOLUTION_Y )
  
  if SOUND then
    if SOUND_ENGINE == 'untz' then
      -- Initialize sound
      MOAIUntzSystem.initialize ()
    end
  end
  
  -- self:loadScene ( logoScreen )
  self:loadScene ( c01s03() )
end


function start ( self )

  -- Initialize game
  self:initialize ()
  hud:initialize ()
  
  -- Camera animation
  -- self.cameraThread = MOAIThread.new ()
  -- self.cameraThread:run ( cameraAnimation )
  
  -- -- Game loop
  -- -- If there is a scene loaded we gather input and update everyhing
  while self.gameRunning do
    local stopInput = false

    -- Send input to HUD first
    if hud.initialized then
       stopInput = hud:onInput ()
    end
    
    if self.currentScene and not stopInput then
      self.currentScene:onInput ()
    end

    coroutine.yield ()
  end

end

function cameraAnimation ()
  while true do
    local x = math.random (CAMERA_MIN_MOVEMENT_X, CAMERA_MAX_MOVEMENT_X)
    local y = math.random (CAMERA_MIN_MOVEMENT_Y, CAMERA_MAX_MOVEMENT_Y)
        
    if (cameraDeltaX + x > CAMERA_MAX_DELTA_X) or (cameraDeltaX + x < -CAMERA_MAX_DELTA_X) then
      x = -x
    end
    
    if (cameraDeltaY + y > CAMERA_MAX_DELTA_Y) or (cameraDeltaY + y < -CAMERA_MAX_DELTA_Y) then
      y = -y
    end
    
    cameraDeltaX = cameraDeltaX + x
    cameraDeltaY = cameraDeltaY + y
    
    local action = camera:moveLoc(x, y, CAMERA_MOVEMENT_DURATION)
    
    MOAICoroutine.blockOnAction ( action )
  end
end


function displayHUD ( self )
  if not hud.initialized then
    hud:initialize ()
  end
  
  for k, layer in pairs (hud.layers) do
    MOAIRenderMgr.removeRenderPass ( layer )
    layer:setViewport ( viewport )
    MOAIRenderMgr.pushRenderPass ( layer )
  end
  
  -- Debug
  if DEBUG then
    debugHUD:initialize ()
  end

end
