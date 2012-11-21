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


sceneFadeOutTime = 200


function game:switchToScene ( scene )
  local shouldWaitFadeout = self.currentScene.fadeOnChange
  
  self:unloadCurrentScene ()
  
  -- If the current scene fades out the new one should be loaded after the fadeout delay
  if shouldWaitFadeout then
    sleepCoroutine ( self.sceneFadeOutTime )
  end
  
  self:loadScene ( scene )
end


function game:unloadCurrentScene ()
  -- Hide Hud
  self:hideHUD ()
  
  if self.currentScene then
    if self.currentScene.fadeOnChange then
      self.currentScene:fadeOut ( self.sceneFadeOutTime )
      performWithDelay ( self.sceneFadeOutTime, self.currentScene.unload, 1, self.currentScene )
    else
      self.currentScene:unload ()
    end
  end
  
  self.currentScene = nil
end


function game:loadScene ( scene )
  
  -- Cache scene
  self.currentScene = scene
  
  -- Initialize hud (must be done after loading a scene)
  hud:initialize ()
  
  -- Show loading screen
  loadingScreen:setup ( scene.objectsCount )
  -- coroutine.yield ()
  
  if not scene.initialized then
    -- Initialize scene
    scene:initialize ()
  else
    -- Reset scene
    scene:resetCamera ()
    scene:resetCharacter ()
    scene:loadConversations ()
  end
  
  self:sceneLoaded ( scene )
  
end


function initialize ( self )
  
  -- Setup viewport
  viewport = MOAIViewport.new ()
  viewport:setSize ( VIEWPORT_RESOLUTION_X, VIEWPORT_RESOLUTION_Y )
  viewport:setScale ( WORLD_RESOLUTION_X, WORLD_RESOLUTION_Y )
  
  if SOUND then
    if SOUND_ENGINE == 'untz' then
      -- Initialize sound
      MOAIUntzSystem.initialize ()
    end
  end
  
  self:loadScene ( logoScreen() )
  -- self:loadScene ( c01s02 )
  -- self:loadScene ( c01s03 () )
  -- self:loadScene ( c01s04 () )
  
  -- Debug
  if DEBUG then
    debugHUD:initialize ()
  end
end


function game:sceneLoaded ( scene )
  --MOAIRenderMgr.setRenderTable ( {} )
  
  -- Load all layers
  local renderTable = {}
  
  for k, layer in pairs( scene:layers() ) do
    layer:setViewport ( viewport )
    layer:setCamera ( self.camera )
    
    if scene.fadeOnChange then
      layer:setColor ( 0, 0, 0, 1 )
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
  
  -- Hide loading screen
  loadingScreen:hide()

  if scene.fadeOnChange then
    performWithDelay ( 50, scene.fadeIn, 1, scene )
  end
  
  if scene.shouldShowHud then
    -- Load HUD
    self:showHUD ()
    dialog:loadConversations(scene.conversations)
  end

end

function start ( self )

  -- Initialize game
  loadingScreen:initialize()
  
  coroutine.yield ()

  self:initialize()

  hud:initialize ()

  -- -- Camera animation
  -- self.cameraThread = MOAIThread.new ()
  -- self.cameraThread:run ( cameraAnimation )
  
  -- Game loop
  -- If there is a scene loaded we gather input and update everyhing
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


function showHUD ( self )
  for k, layer in pairs (hud.layers) do
    MOAIRenderMgr.removeRenderPass ( layer )
    layer:setViewport ( viewport )
    MOAIRenderMgr.pushRenderPass ( layer )
  end
end


function hideHUD ( self )
  for k, layer in pairs ( hud.layers ) do
    MOAIRenderMgr.removeRenderPass ( layer )
  end
end

