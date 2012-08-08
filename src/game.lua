--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "game", package.seeall )

current_scene = nil

camera = MOAICamera2D.new ()

-- camera:setScl( CAMERA_SCALE )

cameraDeltaX = 0
cameraDeltaY = 0


function loadScene ( self, scene )
  -- Cache scene
  self.current_scene = scene
  
  -- Initialize scene
  scene:initialize ()

  -- Load all layers
  for k, layer in pairs( scene:layers() ) do 
    layer:setViewport ( viewport )
    layer:setCamera ( self.camera )
    MOAIRenderMgr.pushRenderPass ( layer )
  end

  -- Load HUD
  self:displayHUD ()

  
end


function initialize ( self )
  -- Setup viewport
  viewport = MOAIViewport.new ()
  viewport:setSize ( SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )
  viewport:setScale ( WORLD_RESOLUTION_X, WORLD_RESOLUTION_Y )
  
  inventory:initialize ( )
  
  self:loadScene ( c01s01 )

end

function start ( self )

  -- Initialize game
  self:initialize ()
  
  -- -- Game loop
  -- -- If there is a scene loaded we gather input and update everyhing
  while true do
    coroutine.yield ()
    
    -- Camera animation
    self.cameraThread = MOAIThread.new ()
    self.cameraThread:run ( cameraAnimation )
    
    
    if self.current_scene then
      if type ( self.current_scene.onInput ) == "function" then
        self.current_scene:onInput ()
      end

      if type ( inventory.onInput ) == "function" then
        inventory:onInput ()
      end
    end
  end

end

function cameraAnimation ( )
  while true do
    
    local x = math.random(-1, 1)
    local y = math.random(-1, 1)
    
    if (cameraDeltaX + x > CAMERA_MAX_DELTA_X) or (cameraDeltaX + x < -CAMERA_MAX_DELTA_X) then
      x = 0
    end

    if (cameraDeltaY + y > CAMERA_MAX_DELTA_Y) or (cameraDeltaY + y < -CAMERA_MAX_DELTA_Y) then
      y = 0
    end
    
    cameraDeltaX = cameraDeltaX + x
    cameraDeltaY = cameraDeltaY + y
    
    MOAICoroutine.blockOnAction ( camera:moveLoc(x, y, 4) )
    
  end
end

function displayHUD ( self )
  -- Inventory
  inventory.inventory_layer:setViewport ( viewport )
  MOAIRenderMgr.pushRenderPass ( inventory.inventory_layer )
end