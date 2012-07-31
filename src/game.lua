--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "game", package.seeall )

current_scene = nil

camera = MOAICamera2D.new ()


function loadScene ( self, scene )
  -- Cache scene
  self.current_scene = scene
  
  -- Initialize scene
  scene:initialize ()

  -- Load all layers
  for k, layer in pairs( scene.layers ) do 
    layer:setViewport ( viewport )
    layer:setCamera ( self.camera )
    MOAIRenderMgr.pushRenderPass ( layer )
  end

end


function initialize ( self )
  self:loadScene ( dummy_room )
end

function start ( self )
  
  -- Initialize game
  self:initialize ()
  
  -- -- Game loop
  -- -- If there is a scene loaded we gather input and update everyhing
  -- while true do
  -- 
  --   coroutine.yield ()
  --    
  --   -- if self.current_scene then
  --   -- 
  --   --       -- if type ( self.scene.onInput ) == "function" then
  --   --       --  self.scene:onInput ()
  --   --       -- end
  --   --  
  --   -- end
  --    
  -- end
  
end