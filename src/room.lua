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
    objects = MOAILayer2D.new (),
    character = MOAILayer2D.new (),
    walk_behind = MOAILayer2D.new ()
  }
  
  room.layers = function (self)
    local result = {}
    
    for k,v in pairs ( self.layer_objects ) do table.insert ( result, v ) end
    
    return result
  end
  
  room.characters = {}
  
  room.objects = {}
  
  room.name = name
  
  room.initialize = function ( self )
    self.before_initialize ()
    
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
  
      if (objX >= -object.half_width) and (objX <= object.half_width) and (objY >= -object.half_height) and (objY <= object.half_height) then
        return object
      end
  
    end
    return nil
  end  

  return room
  
end