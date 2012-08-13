--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "game", package.seeall )

currentScene = nil

camera = MOAICamera2D.new ()

-- camera:setScl( CAMERA_SCALE )

cameraDeltaX = 0
cameraDeltaY = 0


function loadScene ( self, scene )
  -- Cache scene
  self.currentScene = scene
  
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
  
  -- Camera animation
  self.cameraThread = MOAIThread.new ()
  self.cameraThread:run ( cameraAnimation )
  
  -- -- Game loop
  -- -- If there is a scene loaded we gather input and update everyhing
  while true do
    coroutine.yield ()
    
    if self.currentScene then
      if type ( self.currentScene.onInput ) == "function" then
        self.currentScene:onInput ()
      end

      if type ( inventory.onInput ) == "function" then
        inventory:onInput ()
      end
      
      if DEBUG then
        
        local x, y = input_manager.position ()

        if x and y then

          debugHUD:setMouseWindowPosition(x,y)

          x, y = self.currentScene.layer_objects.background:wndToWorld ( x, y )
          debugHUD:setMouseWorldPosition(x,y)
        end
      end
    end
  end

end


function cameraAnimation ()
  while true do
    local x = math.random (CAMERA_MIN_MOVEMENT_X, CAMERA_MAX_MOVEMENT_X)
    local y = math.random (CAMERA_MIN_MOVEMENT_Y, CAMERA_MAX_MOVEMENT_Y)
    
    --[[
    if math.random () > CAMERA_MOVEMENT_DIRECTION_CHANGE_PROBABILITY then
      x = -x
    end
    if math.random () > CAMERA_MOVEMENT_DIRECTION_CHANGE_PROBABILITY then
      y = -y
    end
    ]]--
    
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
    -- action:setListener ( MOAIAction.EVENT_STOP, cameraAnimation )
  end
end


function displayHUD ( self )
  -- Inventory
  inventory.inventory_layer:setViewport ( viewport )
  MOAIRenderMgr.pushRenderPass ( inventory.inventory_layer )
  
  -- Debug
  if DEBUG then
    debugHUD:initialize ()
  end
end
