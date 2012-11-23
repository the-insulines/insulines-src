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
  room.shouldShowHud = true
  room.useInventory = true
  room.useHighlights = true
  room.useDialogs = true
  room.useMap = true
  room.useCellphone = true
  room.fadeOnChange = true
  -- perspective attributes
  -- room.frontCharacterZoom = 0.8
  -- room.bottomCharacterZoomThreshold = -500
  -- 
  -- room.backCharacterZoom = 0.001
  -- room.topCharacterZoomThreshold = -50
  
  -- character movement flag
  room.characterMovement = true
  room.inputEnabled = true
  
  room.layer_objects = {
    background = MOAILayer2D.new (),
    back_objects = MOAILayer2D.new (),
    background_shadows = MOAILayer2D.new (),
    background_highlights = MOAILayer2D.new (),
    objects = MOAILayer2D.new (),
    character = MOAILayer2D.new (),
    walk_behind_objects = MOAILayer2D.new (),
    walk_behind = MOAILayer2D.new (),
    walk_behind_shadows = MOAILayer2D.new (),
    walk_behind_highlights = MOAILayer2D.new (),git
  }
  
  room.blendingModes = {
    background_highlights = MOAIProp2D.BLEND_ADD,
    background_shadows = MOAIProp2D.BLEND_MULTIPLY,
    walk_behind_highlights = MOAIProp2D.BLEND_ADD,
    walk_behind_shadows = MOAIProp2D.BLEND_MULTIPLY,
  }
  
  
  room.initialized = false
  
  function room:layers ()
    local result = {}
    
    table.insert ( result, self.layer_objects.background )
    table.insert ( result, self.layer_objects.back_objects )
    table.insert ( result, self.layer_objects.background_shadows )
    table.insert ( result, self.layer_objects.background_highlights )
    table.insert ( result, self.layer_objects.objects )
    table.insert ( result, self.layer_objects.character )
    table.insert ( result, self.layer_objects.walk_behind_objects )
    table.insert ( result, self.layer_objects.walk_behind )
    table.insert ( result, self.layer_objects.walk_behind_shadows )
    table.insert ( result, self.layer_objects.walk_behind_highlights )
    
    return result
  end
  
  room.characters = {}
  
  room.objects = {}
  
  room.sounds = {}
  
  function room:initialize ( )
    self:beforeInitialize ()
    
    game.camera:setLoc(self.initialCameraX, self.initialCameraY)
    game.camera:setScl(self.initialCameraScl)
    
    -- calculate the perspective factor to apply zoom
    if self.frontCharacterZoom then
      self.perspectiveZoomFactor = (self.frontCharacterZoom - self.backCharacterZoom) / math.abs (self.bottomCharacterZoomThreshold - self.topCharacterZoomThreshold)
    end
    -- Apply default camera and character position
    self:resetCamera ()
    self:resetCharacter ()
    -- 
    -- game:setCamera()
    
    self:afterInitialize ()
    self.initialized = true
  end
  
  function room:resetCamera ( )
    if self.path then
      local offset = self.path.graph[self.initialCameraPathNode].offsets
      camX = offset.x / SCREEN_TO_WORLD_RATIO 
      camY = offset.y / SCREEN_TO_WORLD_RATIO
      camScl = offset.scl
      game.camera:seekLoc (camX, camY, 0.001, MOAIEaseType.FLAT)
      game.camera:seekScl (camScl, camScl, 0.001, MOAIEaseType.FLAT)
    else
      game.camera:seekLoc (0, 0, 0.001, MOAIEaseType.FLAT)
      game.camera:seekScl (1, 1, 0.001, MOAIEaseType.FLAT)
    end
  end
  
  function room:resetCharacter ( )
    if self.objects.josh then
      self.objects.josh.prop:setScl(1)
      self.layer_objects.character:insertProp ( self.objects.josh.prop )
    
      pos = self.path.graph[self.initialCharacterPathNode].position
      self.objects.josh:moveTo(pos.x, pos.y, self.perspectiveZoomFactor, 0.00001)
    
      self.characterMovement = true
    end
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
  
  
  function room:addObjects ( objects )
    self.objectsCount = 0
    for k,v in pairs ( objects ) do 
      self.objects[k] = v
      self.objectsCount = self.objectsCount + 1
    end
  end
  
  function room:loadObjects ( )
    for k, v in pairs ( self.objects ) do
      local object = self.objects[k]
      loadingScreen:step()
      -- Load resource
      if v.resource_name then
        local resource
        if self.hasExternalAssets and not object.externalAsset then
          v.fileName = v.resource_name  -- TODO: THIS IS NOT GOOD, JUST FOR BACKWARD COMPATIBILITY
          resource = v
          object.gfx = resource_cache.get ( k, v )
        else
          resource = resources[object.resource_name]
          object.gfx = resource_cache.get ( v.resource_name )
        end
        
        -- Create prop
        if object.animated then
          -- create an animated prop of the type of the object
          object.animation = AnimatedProp.new ( resource.type )
          object.animation:setDeck ( object.gfx )
          if object.sounds then
            object.animation:addSounds ( object.sounds )
          end
          object.prop = object.animation.prop
        else
          object.prop = MOAIProp2D.new ()
          object.prop:setDeck ( object.gfx )
        end
        
        object.prop:setLoc ( object.x / SCREEN_TO_WORLD_RATIO, object.y / SCREEN_TO_WORLD_RATIO )
        if object.renderPriority then
          object.prop:setPriority ( object.renderPriority )
        end
        
        -- Load animations for animated prop
        if object.animated then
          if resource.type == RESOURCE_TYPE_ANIMATION_FRAMES then
            self:loadAnimations ( object.animation, resource.animations )
          else
            self:loadAnimations ( object.animation, object.animations )
          end
        end
        
        -- Add to layer and inherit it's blending mode
        object.layer = self.layer_objects[object.layer_name]
        local layerBlendingMode = self.blendingModes[object.layer_name]
        if layerBlendingMode then
          object.prop:setBlendMode ( layerBlendingMode )
        end
        if object.render_at_start then
          self:startRendering ( k )
        end
        
        -- Add dimensions
        object.half_width = resource.width / 2 / SCREEN_TO_WORLD_RATIO
        object.half_height = resource.height / 2 / SCREEN_TO_WORLD_RATIO
      end
    end
  end
  
  function room:loadConversations ( conversations )
    self.conversations = conversations
  end
  
  
  function room:loadCharacter ( object )
    -- Add to layer
    object.layer = self.layer_objects[object.layer_name] or self.layer_objects.character
    
    if object.render_at_start then
      object.layer:insertProp ( object.prop )
      object.rendering = true
    end
    
    -- set the rendering priority of the prop
    if object.renderPriority then
      object.prop:setPriority ( object.renderPriority )
    end
    
    -- Add dimensions
    object.half_width = resources[object.name].width / 2
    object.half_height = resources[object.name].height / 2

    self.objects[object.name] = object
    
  end
  
  
  function room:addSounds ( sounds )
    for k, v in pairs (sounds) do
      self.sounds[k] = v
    end
  end


  function room:loadSounds ()
    for k, v in pairs (self.sounds) do
      self.sounds[k] = resource_cache.get(v.resource_name)
    end
  end
  
    
  function room:onInput ( )
    if self.inputEnabled then
      if input_manager.down () then
        
        local x, y = input_manager.getTouch ()
        x, y = self.layer_objects.objects:wndToWorld ( x, y )
        local targetPoint = point ( x, y )
        
        -- Collision detection
        local object = self:objectAt ( x, y )
        local callback = nil
        if object then
          
          -- set the target point of the object that will be used for character movement
          if object.pathNode then
            targetPoint = self.path.graph[object.pathNode].position
          end
          
          -- set the callback method when finished walking
          if type (object.onClick) == "function" then
            if self.characterMovement then
              callback = { method = object.onClick }
            else
              object:onClick ()
            end
          end
        else
        end
        
        
        if self.characterMovement then
          local char = self.objects.josh

          if char and char.rendering then
          
            -- stop previous movement
            if self.characterMovementCoroutine then self.characterMovementCoroutine:stop () end
            
            self:moveCharacterToPosition ( char, targetPoint, callback )
          end
        
        end
      
      end
    end
  end

  function room:moveCharacterToNode (characterName, node, callback_method, callback_parent)
    local char = self.objects[characterName]
    local position = self.path.graph[node].position
    local callback = { method = callback_method, parent = callback_parent }
    
    self:moveCharacterToPosition ( char, position, callback )
  end
  
  
  function room:moveCharacterToPosition ( character, position, callback )
    local steps = self.path:steps ( point ( character.prop:getLoc () ), position )
    self.characterMovementCoroutine = MOAICoroutine.new ()
    self.characterMovementCoroutine:run( character.moveThroughSteps, character, steps, self.perspectiveZoomFactor, callback )
  end
  
  
  function room:reload ()
    
  end
  
  function room:stopRendering ( object )
    local o = self.objects[object]
    if o then
      o.layer:removeProp ( o.prop )
      o.rendering = false
    end
  end

  function room:startRendering ( object )
    local o = self.objects[object]
    
    if o.renderPriority then
      o.prop:setPriority ( o.renderPriority )
    end

    if o then
      o.layer:insertProp ( o.prop )
      o.rendering = true
    end
  end


  function room:fadeOut ( time )
    if not time then time = 100 end
    
    for k, layer in pairs ( MOAIRenderMgr.getRenderTable () ) do
      layer:seekColor ( 0, 0, 0, 1, time/100 )
    end
  end
  
  
  function room:fadeIn ()
    for k,layer in pairs ( MOAIRenderMgr.getRenderTable () ) do
      layer:seekColor ( 1, 1, 1, 1, 1)
    end
  end
  
  
  function room:loadPath ( graph )
    
    self.path = Path.new ( graph )

    if DEBUG then
      self.path:debug( self.layer_objects.objects )
    end
    
  end
  
  
  function room:placeObjectsOnPath ( objectPlacementOnPath )
    for objectName, pathNode in pairs ( objectPlacementOnPath ) do
      self.objects[objectName].pathNode = pathNode
    end
  end
  
  
  function room:loadObjectInteractions ( objectInteractions )
    for objectName, interactions in pairs ( objectInteractions ) do
      print (objectName)
      for interactionName, interaction in pairs ( interactions ) do
        self.objects[objectName][interactionName] = interaction
      end
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
  
  
  function room:removeLayers ()
    for k, layer in pairs ( self.layer_objects ) do
      MOAIRenderMgr.removeRenderPass ( layer )
    end
  end
  
  
  function room:unload ()
    self:removeLayers ()
    
    -- release objects
    for k, obj in pairs ( self.objects ) do
      -- check resource name (keeping compatibility with the old name convention)
      if obj.resource_name then
        local resource_name = nil
        if self.hasExternalAssets and not object.externalAsset then
          resource_name = k
        else
          resource_name = obj.resource_name
        end
      end
      
      print ('>> UNLOADING FROM CACHE: ', obj.resource_name)
      resource_cache.unload(obj.resource_name)
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
  
  
  function room:interact ( source, target )
    target:onInteractionWith( source )
  end
  
  
  function room:startHighlightingInteractions ()
    for k, object in pairs ( self.objects ) do
      if object.highlight then
        object.prop:seekColor ( HIGHLIGHT_COLOR.r, HIGHLIGHT_COLOR.g, HIGHLIGHT_COLOR.b, HIGHLIGHT_COLOR.a, HIGHLIGHT_TIME )
      end
    end
  end

  
  function room:stoptHighlightingInteractions ()
    for k, object in pairs ( self.objects ) do
      if object.highlight then
        object.prop:moveColor(1,1,1,1,HIGHLIGHT_TIME)
      end
    end
  end

  ----------------------------------------------------------------
  -- internal functions
  ----------------------------------------------------------------
  
  function room:loadAnimations ( animatedProp, animations )
    for k, v in pairs ( animations ) do
      -- add animation based on wether it is based on a spritesheet or framed
      if animatedProp.animationType == AnimatedProp.ANIMATION_TYPE_SPRITESHEET then
        animatedProp:addAnimation ( unpack ( v ) )
      elseif animatedProp.animationType == AnimatedProp.ANIMATION_TYPE_MULTITEXTURE then
        animatedProp:addAnimation ( k, v.startFrame, v.frameCount, v.frameTime, v.mode, v.parentAnimationName )
      end
    end
  end
  
  function room:objectAt ( x, y )
    local resultObject = nil
    local maxPriority = nil
    for k, object in pairs ( self.objects ) do
      if object.prop then
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
    end
    return resultObject
  end
  
  
  return room
  
end