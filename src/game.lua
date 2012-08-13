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
  
  -- Camera animation
  self.cameraThread = MOAIThread.new ()
  self.cameraThread:run ( cameraAnimation )
  
  -- -- Game loop
  -- -- If there is a scene loaded we gather input and update everyhing
  while true do
    coroutine.yield ()
    
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


function cameraAnimation ()
  while true do
    local x = CAMERA_MIN_MOVEMENT_X + math.random (0, 2)
    local y = CAMERA_MIN_MOVEMENT_Y + math.random (0, 2)
    if math.random () > 0.5 then
      x = -x
    end
    if math.random () > 0.5 then
      y = -y
    end
    
    if (cameraDeltaX + x > CAMERA_MAX_DELTA_X) or (cameraDeltaX + x < -CAMERA_MAX_DELTA_X) then
      print ('camera bounce x')
      x = -x
    end
    
    if (cameraDeltaY + y > CAMERA_MAX_DELTA_Y) or (cameraDeltaY + y < -CAMERA_MAX_DELTA_Y) then
      print ('camera bounce y')
      y = -y
    end
    
    cameraDeltaX = cameraDeltaX + x
    cameraDeltaY = cameraDeltaY + y
    
    print ( 'camera movement: ', x, ' ; ', y )
    
    local action = camera:moveLoc(x, y, 1.5)
    MOAICoroutine.blockOnAction ( action )
    -- action:setListener ( MOAIAction.EVENT_STOP, cameraAnimation )
  end
end


function displayHUD ( self )
  -- Inventory
  inventory.inventory_layer:setViewport ( viewport )
  MOAIRenderMgr.pushRenderPass ( inventory.inventory_layer )
end
