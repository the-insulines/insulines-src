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
  room.frontCharacterZoom = 0.8
  -- room.bottomCharacterZoomThreshold = -200
  room.bottomCharacterZoomThreshold = -500
  
  room.backCharacterZoom = 0.001
  room.topCharacterZoomThreshold = -50
  
  room.initialCharacterZoom = 1

  -- character movement flag
  room.characterMovement = true
  room.inputEnabled = true
  
  room.layer_objects = {
    background = MOAILayer2D.new (),
    background_shadows = MOAILayer2D.new (),
    background_highlights = MOAILayer2D.new (),
    back_objects = MOAILayer2D.new (),
    objects = MOAILayer2D.new (),
    character = MOAILayer2D.new (),
    walk_behind = MOAILayer2D.new (),
    walk_behind_shadows = MOAILayer2D.new (),
    walk_behind_highlights = MOAILayer2D.new (),git
  }
  
  room.layer_objects.background_highlights:setBlendMode(MOAIProp2D.BLEND_ADD)
  room.layer_objects.background_shadows:setBlendMode(MOAIProp2D.BLEND_MULTIPLY)
  room.layer_objects.walk_behind_highlights:setBlendMode(MOAIProp2D.BLEND_ADD)
  room.layer_objects.walk_behind_shadows:setBlendMode(MOAIProp2D.BLEND_MULTIPLY)
  
  room.initialized = false
  
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
    self.perspectiveZoomFactor = (self.frontCharacterZoom - self.backCharacterZoom) / math.abs (self.bottomCharacterZoomThreshold - self.topCharacterZoomThreshold)
    
    self:afterInitialize ()
    self.initialized = true
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
      object.rendering = true
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
      if object.renderPriority then
        object.prop:setPriority ( object.renderPriority )
      end
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
    if self.inputEnabled then
      if input_manager.down () then
      
        local x, y = input_manager.getTouch ()
        x, y = self.layer_objects.objects:wndToWorld ( x, y )
      
        -- Collision detection
        local object = self:objectAt ( x, y )
        local callback = nil
        if object then
          if type (object.onClick) == "function" then
            if self.characterMovement then 
              callback = { method = object.onClick, parent = object }
            else
              object:onClick ()
            end
          end
        else
        end
      
      
      
        if self.characterMovement then
          local char = self.objects.main_character

          if char and char.rendering then
          
            if self.characterMovementCoroutine then self.characterMovementCoroutine:stop () end
          
            local steps = self.path:steps ( point ( char.prop:getLoc () ),  point ( x, y ) )
            self.characterMovementCoroutine = MOAICoroutine.new ()
            self.characterMovementCoroutine:run( char.moveThroughSteps, char, steps, self.perspectiveZoomFactor, callback )
          
          end
        
        end
      
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


  room.fadeOut = function ( self, time )
    if not time then time = 1 end
    for k,layer in pairs ( self.layer_objects ) do
      layer:seekColor ( 0, 0, 0, 1, time)
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
  
  function room:playThemeSong ()
    self.theme_song = resource_cache.get(self.name .. '_theme')
    self.theme_song:setVolume ( 0 )
    self.theme_song:play ()
    self.theme_song:seekVolume ( 1, 1 )
  end
  
  function room:stopThemeSong ()
    if self.theme_song and self.theme_song:isPlaying () then
      self.theme_song:stop ()
    end
  end  
  
  function room:unload ()
    self:fadeOut ()
    performWithDelay ( 100, self.removeLayers, 1, self)
  end
  
  function room:removeLayers ()
    for k, layer in pairs ( self.layer_objects ) do
      MOAIRenderMgr.removeRenderPass ( layer )
    end
  end
  
  function room:interactionForPosition (source, x, y)
    if x and y then
      local x, y = self.layer_objects.background:wndToWorld(x, y)
      local target = self:objectAt(x, y)
    
      if target and target.interactsWith then
        for k, targetInteraction in pairs ( target.interactsWith ) do
          if targetInteraction == source.key then
            return target
          end
        end
      end
    end
  end
  
  function room:interact (source, target)
    target:onInteractionWith(source)
  end
  ----------------------------------------------------------------
  -- internal functions
  ----------------------------------------------------------------
  
  function room:loadAnimations ( animatedProp, animations )
    for k,v in pairs ( animations ) do
      animatedProp:addConstantAnimation ( unpack ( v ) )
    end
  end
  
  function room:objectAt ( x, y )
    local resultObject = nil
    local maxPriority = nil
    for k, object in pairs( self.objects ) do
      local objX, objY = object.prop:worldToModel ( x, y )
  
      if (objX >= -object.half_width) and (objX <= object.half_width) and (objY >= -object.half_height) and (objY <= object.half_height) and (not object.avoid_clicks) and object.rendering then
        if not maxPriority then
          resultObject = object
          if object.priority then maxPriority = object.priority end
        else
          if object.priority and maxPriority < object.priority then
            resultObject = object
            maxPriority = object.priority
          end
        end
      end
      
    end
    return resultObject
  end
  

  return room
  
end