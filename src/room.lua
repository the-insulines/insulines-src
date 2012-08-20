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
  
  -- perspective attributes
  room.frontCharacterZoom = 1
  room.bottomCharacterZoomThreshold = -200
  
  room.backCharacterZoom = 0.4
  room.topCharacterZoomThreshold = 200
  
  -- character movement flag
  room.characterMovement = true
  
  room.layer_objects = {
    background = MOAILayer2D.new (),
    background_shadows = MOAILayer2D.new (),
    background_highlights = MOAILayer2D.new (),
    back_objects = MOAILayer2D.new (),
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
    
    table.insert ( result, self.layer_objects.background )
    table.insert ( result, self.layer_objects.background_shadows )
    table.insert ( result, self.layer_objects.background_highlights )
    table.insert ( result, self.layer_objects.back_objects )
    table.insert ( result, self.layer_objects.objects )
    table.insert ( result, self.layer_objects.character )
    table.insert ( result, self.layer_objects.walk_behind )
    table.insert ( result, self.layer_objects.walk_behind_highlights )
    table.insert ( result, self.layer_objects.walk_behind_shadows )
    return result
  end
  
  room.characters = {}
  
  room.objects = {}
  
  room.initialize = function ( self )
    self:beforeInitialize ()
    
    game.camera:setLoc(self.initialCameraX, self.initialCameraY)
    game.camera:setScl(self.initialCameraScl)
    
    -- calculate the perspective factor to apply zoom
    self.perspectiveZoomFactor = (self.frontCharacterZoom - self.backCharacterZoom) / (self.bottomCharacterZoomThreshold - self.topCharacterZoomThreshold)
    
    self:afterInitialize ()
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
  
  function room:loadCharacter ( object )
    
    -- Add to layer
    object.layer = self.layer_objects.character
    
    if object.render_at_start then
      object.layer:insertProp ( object.prop )
    end

    -- Add dimensions
    object.half_width = resources[object.name].width / 2
    object.half_height = resources[object.name].height / 2

    self.objects[object.name] = object
    
  end
  
  room.loadObjects = function ( self )
    for k,v in pairs ( self.objects ) do
      local object = self.objects[k]
      
      -- Load resource
      object.gfx = resource_cache.get ( v.resource_name )

      -- Create prop
      if object.animated then
        -- create an animated prop
        object.animation = AnimatedProp.new ()
        object.animation:setDeck ( object.gfx )
        object.prop = object.animation.prop
      else
        object.prop = MOAIProp2D.new ()
        object.prop:setDeck ( object.gfx )
      end
      
      object.prop:setLoc ( object.x, object.y )
      
      -- Load animations for animated prop
      if object.animated then
        self:loadAnimations ( object.animation, object.animations )
      end
      
      -- Add to layer
      object.layer = self.layer_objects[object.layer_name]
      if object.render_at_start then
        self:startRendering( k )
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
      

      if self.characterMovement then
        local char = self.objects.main_character

        if char then
          local steps = self.path:steps ( point ( char.prop:getLoc () ),  point ( x, y ) )
          char:moveThroughSteps( steps, self.perspectiveZoomFactor )
        end
      end
      
      -- Collision detection
      local object = self:objectAt ( x, y )
      
      if object then
        -- dialog_manager:displayText ( object.name )
        if type (object.onClick) == "function" then
          object.onClick ()
        end
      else
      end
    end
  end
  
  room.stopRendering = function ( self, object )
    local o = self.objects[object]
    if o then
      o.layer:removeProp ( o.prop )
      o.rendering = false
    end
  end

  room.startRendering = function ( self, object )
    local o = self.objects[object]

    if o then
      o.layer:insertProp ( o.prop )
      o.rendering = true
    end
  end


  room.fadeOut = function ( self )
    for k,layer in pairs ( self.layer_objects ) do
      layer:seekColor ( 0, 0, 0, 1, 1)
    end
  end
  

  room.fadeIn = function ( self )
    for k,layer in pairs ( self.layer_objects ) do
      layer:seekColor ( 1, 1, 1, 1, 1)
    end
  end
  
  function room:loadPath ( graph )
    
    self.path = Path.new ( graph )

    if DEBUG then
      self.path:debug( self.layer_objects.objects )
    end
    
  end
  
  ----------------------------------------------------------------
  -- internal functions
  ----------------------------------------------------------------
  
  function room:loadAnimations ( animatedProp, animations )
    for k,v in pairs ( animations ) do
      animatedProp:addConstantAnimation ( unpack ( v ) )
    end
  end
  
  room.objectAt = function ( self, x, y )
  
    for k, object in pairs( self.objects ) do
  
      local objX, objY = object.prop:worldToModel ( x, y )
  
      if (objX >= -object.half_width) and (objX <= object.half_width) and (objY >= -object.half_height) and (objY <= object.half_height) and (not object.avoid_clicks) and object.rendering then
        return object
      end
  
    end
    return nil
  end
  

  return room
  
end