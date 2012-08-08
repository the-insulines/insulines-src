--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "room", package.seeall )

function new (name)
  local room = {}
  
  room.name = name
  
  room.layer_objects = {
    background = MOAILayer2D.new (),
    background_shadows = MOAILayer2D.new (),
    background_highlights = MOAILayer2D.new (),
    objects = MOAILayer2D.new (),
    character = MOAILayer2D.new (),
    walk_behind = MOAILayer2D.new (),
    walk_behind_shadows = MOAILayer2D.new (),
    walk_behind_highlights = MOAILayer2D.new (),
  }
  
  room.layer_objects.background_highlights:setBlendMode(MOAIProp2D.BLEND_ADD)
  room.layer_objects.background_shadows:setBlendMode(MOAIProp2D.BLEND_MULTIPLY)
  room.layer_objects.walk_behind_highlights:setBlendMode(MOAIProp2D.BLEND_ADD)
  room.layer_objects.walk_behind_shadows:setBlendMode(MOAIProp2D.BLEND_MULTIPLY)
  
  room.layers = function (self)
    local result = {}
    
    -- -- for k,v in pairs ( self.layer_objects ) do table.insert ( result, v ) end
    -- for k,v in pairs ( self.layer_objects ) do print ( k) end
    
    table.insert ( result, self.layer_objects.background )
    table.insert ( result, self.layer_objects.background_shadows )
    table.insert ( result, self.layer_objects.background_highlights )
    table.insert ( result, self.layer_objects.objects )
    table.insert ( result, self.layer_objects.character )
    table.insert ( result, self.layer_objects.walk_behind )
    table.insert ( result, self.layer_objects.walk_behind_highlights )
    table.insert ( result, self.layer_objects.walk_behind_shadows )
    return result
  end
  
  room.characters = {}
  
  room.objects = {}
  
  room.name = name
  
  room.initialize = function ( self )
    self.before_initialize ()
    
    game.camera:setLoc(self.initialCameraX, self.initialCameraY)
    game.camera:setScl(self.initialCameraScl)
    
    self.after_initialize ()
  end
  
  -- To do initializations on your room use these callbacks.
  room.before_initialize = function ()
    if DEBUG then
      print ( name .. ": Before initialize, overload me!" )
    end
  end
  
  room.after_initialize = function ()
    if DEBUG then
      print ( name .. ": After initialize, overload me!" )
    end
  end
  -- End initialization callbacks
  
  
  room.addObjects = function ( self, objects )
    for k,v in pairs ( objects ) do 
      self.objects[k] = v
    end
  end
  
  room.loadObjects = function ( self )
    for k,v in pairs ( self.objects ) do
      local object = self.objects[k]
      
      -- Load resource
      object.gfx = resource_cache.get ( v.resource_name )

      -- Create prop
      object.prop = MOAIProp2D.new ()
      object.prop:setDeck ( object.gfx )
      object.prop:setLoc ( object.x, object.y )
      
      -- Add to layer
      object.layer = self.layer_objects[object.layer_name]
      if object.render_at_start then
        object.layer:insertProp ( object.prop )
      end
      
      -- Add dimensions
      object.half_width = resources[v.resource_name].width / 2
      object.half_height = resources[v.resource_name].height / 2
    end
  end
  
  room.onInput = function ( self )
    if input_manager.down () then

      local x, y = input_manager.getTouch ()
      x, y = self.layer_objects.objects:wndToWorld ( x, y )

      -- Collision detection
      local object = self:objectAt ( x, y )
      if object then
        MOAILogMgr.log("Tap at: " .. x .. ", " .. y .. " " .. object.resource_name .. "\n")
      else 
        MOAILogMgr.log("Tap at: " .. x .. ", " .. y .. "\n")
      end

      if object then
        -- dialog_manager:displayText ( object.name )
        if type (object.onClick) == "function" then
          object.onClick ()
        end
      end
    end
  end
  
  room.stopRendering = function ( self, object )
    local o = self.objects[object]
    o.layer:removeProp ( o.prop )
  end

  ----------------------------------------------------------------
  -- internal functions
  ----------------------------------------------------------------

  room.objectAt = function ( self, x, y )
  
    for k, object in pairs( self.objects ) do
  
      local objX, objY = object.prop:worldToModel ( x, y )
  
      if (objX >= -object.half_width) and (objX <= object.half_width) and (objY >= -object.half_height) and (objY <= object.half_height) and (not object.avoid_clicks) then
        return object
      end
  
    end
    return nil
  end  

  return room
  
end