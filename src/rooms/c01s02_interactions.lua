c01s02_objectInteractions = {

  background = {
    avoid_clicks = true
  },
  
  bob_bedroom_closed = {
    onClick = function ()
      dialog:load('locked')
    end
  },

  bedroom_opened = {
    onClick = function ()
      game:switchToScene ( c01s01, 'door', 'door' )
    end
  },
  
  television = {
    onClick = function ()
      dialog:load('tv')
    end
  },

  answering_machine = {
    onClick = function ( self )
      self.animation:stopCurrentAnimation()
      self.animation:startAnimation ( 'stopped' )
      --stateManager.state.answered = true
      dialog:load("message")
    end
  },
  
  -- ------------------------------------------------------
  -- Bathroom Puzzle
  -- ------------------------------------------------------
  
  bathroom_closed = {
    onClick = function ()
      if not stateManager.state.c01s02.bathroom then
        -- Avoid clicks
        game.currentScene.inputEnabled = false
        
        -- Open bathroom door
        game.currentScene:stopRendering('bathroom_closed')
        game.currentScene:startRendering('bathroom_opened')

        -- Move character to bathroom
        game.currentScene:moveCharacterToNode('josh', 'bathroom', game.currentScene.objects.bathroom_opened.inBathroom, game.currentScene)
      else
        dialog:load('bathroom_' .. math.random(2))
      end
    end
  },
  
  bathroom_opened = {
    inBathroom = function ( self )

      -- Close bathroom door
      game.currentScene:stopRendering("josh")
      game.currentScene:stopRendering("bathroom_opened")
      game.currentScene:startRendering("bathroom_closed")
      
      if not inventory.opened then
        inventory:openInventory ()
      end

      game.currentScene.inputEnabled = true      
      performWithDelay(10, self.objects.bathroom_opened.addBathroomItems, 1, self)

    end,
    
    addBathroomItems = function ( self )
      inventory:addItem( 'toothpaste', game.currentScene.objects.toothpaste )
      inventory:addItem( 'toothbrush', game.currentScene.objects.toothbrush )
      inventory:addItem( 'floss', game.currentScene.objects.floss )
    end,
    
    leaveBathroom = function ( self )
      inventory:findAndRemoveItem('toothbrush_with_toothpaste')
      
      if inventory.opened then
        inventory:closeInventory ()
      end
      
      game.currentScene.objects.josh:standLookingInDirection ( DIRECTION_FRONT )
      
      game.currentScene:stopRendering("bathroom_opened")
      game.currentScene:startRendering("bathroom_closed")
      dialog:load('left_bathroom')
      game.currentScene.inputEnabled = true
      game.currentScene.characterMovement = true
      stateManager.state.c01s02.bathroom = true
    end
    
  },
  
  toothpaste = {
    interactsWith = { 'toothbrush' },
    onInteractionWith = function ( self, item )
    
      inventory:removeItem ( item )
      if self.invTarget then
        inventory:removeItem ( self.invTarget )
      else
        inventory:removeItem ( self )
      end
    
      inventory:addItem ( 'toothbrush_with_toothpaste', game.currentScene.objects.toothbrush_with_toothpaste )
      
      game.currentScene.inputEnabled = false
      
      performWithDelay ( 50, game.currentScene.sounds.toothbrush.play, 1, game.currentScene.sounds.toothbrush )

      performWithDelay ( 800, game.currentScene.sounds.flush.play, 1, game.currentScene.sounds.flush )
      
      if inventory.opened then
        inventory:closeInventory ()
      end
      
      game.currentScene.inputEnabled = false

      performWithDelay ( 1150, game.currentScene.stopRendering, 1, game.currentScene, "bathroom_closed" )
      performWithDelay ( 1150, game.currentScene.startRendering, 1, game.currentScene, "bathroom_opened" )
      performWithDelay ( 1150, game.currentScene.startRendering, 1, game.currentScene, "josh" )
      performWithDelay ( 1150, game.currentScene.moveCharacterToNode, 1, game.currentScene, 'josh', 'bathroomDoor', game.currentScene.objects.bathroom_opened.leaveBathroom, game.currentScene )
    end
    
  },
  
  toothbrush = {
    interactsWith = { 'toothpaste' },
    onInteractionWith = function ( self, item )
      if item.key == 'toothpaste' then
        item.object.onInteractionWith(item, self.invTarget )
      end
    end
  },

  -- ------------------------------------------------------
  -- End Bathroom Puzzle
  -- ------------------------------------------------------
  
  -- ------------------------------------------------------
  -- Fridge
  -- ------------------------------------------------------
  
  freezer_opened = {
    onClick = function ()
      game.currentScene:stopRendering('freezer_opened')
      game.currentScene:startRendering('freezer_closed')
      -- game.currentScene:stopRendering('cube_tray')
    end
  },

  fridge_opened = {
    onClick = function ()
      game.currentScene:stopRendering('fridge_opened')
      game.currentScene:startRendering('fridge_closed')
    end
  },  
  
  -- ------------------------------------------------------
  -- End Fridge
  -- ------------------------------------------------------
  
  -- -----------------------------------------------------------------
  -- Coffee Puzzle
  -- -----------------------------------------------------------------
  
  coffeeMaker = {
    interactsWith = { 'coffeePackage', 'coffeePotEmpty', 'coffeePotWater' },
    onClick = function ()
      dialog:load ( 'coffeemaker' )
    end,
    prepareCoffee = function ( self )
      local fadeIn = function ()
        game.currentScene:fadeIn ()
        self.animation:startAnimation ( 'coffeemaker_used' )
        game.currentScene:stopRendering ( 'coffeePotEmpty' )
        game.currentScene:startRendering ( "coffeePotFull" )
        game.currentScene.objects.mug_full.animation:startAnimation ( 'mug_full_smoke' )
        game.currentScene.objects.mug_full.highlight = true
        game.currentScene:startRendering ( "mug_full" )
        stateManager.state.c01s02.madeCoffee = true
        game.currentScene.objects.coffeeMaker.highlight = false
        
        if stateManager.state.c01s02.hadCoffee then
          game.currentScene.objects.mug_full.animation:stopCurrentAnimation ()
          game.currentScene:stopRendering( 'mug_full' )
          game.currentScene:startRendering( 'mug_empty' )
        end
      end
      
      game.currentScene:fadeOut ()
      performWithDelay ( 100, fadeIn, 1, self )
    end,
    onInteractionWith = function ( self, item )
      if item.key == 'coffeePackage' then
        if not stateManager.state.c01s02.hasCoffee then
          -- TODO: How to give feedback when coffee is used?
          stateManager.state.c01s02.hasCoffee = true
          inventory:removeItem( item )
          -- display the coffee loaded sprite
          self.animation:startAnimation ( 'coffeemaker_loaded' )
        end
        
        if stateManager.state.c01s02.hasWater then
          self:prepareCoffee ()
        end
      end
      
      if item.key == 'coffeePotEmpty' then
        dialog:load ( "fill_coffee_pot_first" )
      end
      
      if item.key == 'coffeePotWater' then
        stateManager.state.c01s02.hasWater = true
        inventory:removeItem ( item )
        
        -- place the empty pot on the coffee maker
        game.currentScene.objects.coffeePotEmpty.prop:setLoc ( self.x - 7, self.y - 78 )
        game.currentScene.objects.coffeePotEmpty.onClick = nil
        game.currentScene:startRendering ( 'coffeePotEmpty' )
        
        if stateManager.state.c01s02.hasCoffee then
          self:prepareCoffee ()
        end
      end
    end
  },
  
  pantry_closed = {
    onClick = function ()
      game.currentScene:stopRendering ( 'pantry_closed' )
      game.currentScene:startRendering ( 'pantry_opened' )
      if not stateManager.state.c01s02.coffeePickedUp then
        game.currentScene:startRendering ( 'coffeePackage' )
      end
    end
  },
  
  pantry_opened = {
    onClick = function ()
      if not stateManager.state.c01s02.coffeePickedUp then
        game.currentScene:stopRendering ( 'coffeePackage' )
        inventory:addItem ( "coffeePackage", game.currentScene.objects.coffeePackage )
        stateManager.state.c01s02.coffeePickedUp = true
      else
        game.currentScene:stopRendering ( 'pantry_opened' )
        game.currentScene:startRendering ( 'pantry_closed' )
      end
      
    end
  },

  coffeePackage = {
    pickedUp = false,
    avoid_clicks = true
  },

  coffeePotEmpty = {
    water = false,
    onClick = function ()
      inventory:addItem ( 'coffeePotEmpty', game.currentScene.objects.coffeePotEmpty)
      game.currentScene:stopRendering('coffeePotEmpty')
    end,
  },

  coffeePotFull = {
    onClick = function ()
      dialog:load('cofeepot')
    end,
  },
  
  mug_full = {
    onClick = function ()
      dialog:load("coffeemug")
      game.currentScene.objects.mug_full.animation:stopCurrentAnimation ()
      game.currentScene:stopRendering( 'mug_full' )
      game.currentScene:startRendering( 'mug_empty' )
      stateManager.state.c01s02.hadCoffee = true
    end
  },

  mug_empty = {
    onClick = function ()
      dialog:load("stole_mug")
    end
  },
  
  sink = {
    interactsWith = { 'coffeePotEmpty' },
    
    stopFlowing = function ()
      game.currentScene.objects.sink.animation:startAnimation ( 'stopped' )
      game.currentScene.objects.sink.flowing = false
    end,
    
    startFlowing = function ()
      game.currentScene.objects.sink.animation:startAnimation ( 'flowing' )
      game.currentScene.objects.sink.flowing = true
      performWithDelay (450, game.currentScene.objects.sink.stopFlowing, 1)
      game.currentScene.sounds.sink_flowing:play ()
    end,
    
    onInteractionWith = function ( self, item )
      if game.currentScene.objects.coffeePotEmpty.water then
        dialog:load("coffee_pot_with_water")
      else
        
        if not game.currentScene.objects.sink.flowing then
          game.currentScene.objects.sink.startFlowing ()
        end
        
        game.currentScene.objects.coffeePotEmpty.water = true
        inventory:removeItem(item)
        inventory:addItem('coffeePotWater', game.currentScene.objects.coffeePotWater)
      end
    end,
    
    flowing = false,
    
    onClick = function ()
      game.currentScene.objects.sink.animation:stopCurrentAnimation ()
      if game.currentScene.objects.sink.flowing then
        game.currentScene.objects.sink.stopFlowing ()
        game.currentScene.sounds.sink_flowing:stop ()
      else
        game.currentScene.objects.sink.startFlowing ()
      end
    end
  },
  
  -- ------------------------------------------------------
  -- End Coffee Puzzle
  -- ------------------------------------------------------
  
  -- -----------------------------------------------------------------
  -- Nancy Puzzle
  -- -----------------------------------------------------------------
  
  apartmentDoor = {
    closeDoor = function ()
      game.currentScene:startRendering ( 'apartmentDoor' )
      game.currentScene:stopRendering ( 'apartmentDoorOpened' )
      
      -- characters look at each other
      game.currentScene.objects.josh:standLookingInDirection ( DIRECTION_RIGHT )
      game.currentScene.objects.nancy:standLookingInDirection ( DIRECTION_LEFT )
    end,
    
    beginNancy = function ()
      game.currentScene:stopRendering ( 'apartmentDoor' )
      game.currentScene:startRendering ( 'apartmentDoorOpened' )
      
      game.currentScene:loadCharacter ( nancy () )
      local pos = game.currentScene.path.graph[game.currentScene.initialNancyPathNode].position
      game.currentScene.objects.nancy.prop:setLoc(pos.x, pos.y)
      game.currentScene.objects.nancy:moveTo(pos.x, pos.y, game.currentScene.perspectiveZoomFactor, 0.00001)
      game.currentScene:startRendering ( 'nancy' )
      game.currentScene:moveCharacterToNode('nancy', game.currentScene.finalNancyPathNode, game.currentScene.objects.apartmentDoor.closeDoor, game.currentScene)
      stateManager.state.c01s02.talkedToNancy = true
      
      stateManager.state.map.fair = true
      dialog:load('nancy')
    end,
    onClick = function ()
      if stateManager.state.c01s02.pickedFlyer then
        
        if stateManager.state.c01s02.bathroom and stateManager.state.c01s02.hadCoffee then
        
          if not stateManager.state.c01s02.talkedToNancy then
            game.currentScene.objects.apartmentDoor.beginNancy ()
          else
            game.currentScene:stopRendering ( 'apartmentDoor' )
            game.currentScene:startRendering ( 'apartmentDoorOpened' )
            
            game:switchToScene ( map )
          end
          
        else
          game.currentScene.objects.apartmentDoor:dialogRequirements ()
        end
      else
        -- pickup flyer
        stateManager.state.c01s02.pickedFlyer = true
        game.currentScene:stopRendering('flyer')
        dialog:load('flyer')
      end
    end,
    
    dialogRequirements = function ( self )
      if not stateManager.state.c01s02.bathroom and not stateManager.state.c01s02.hadCoffee then
        dialog:load('bathroom_and_coffee')
      elseif not stateManager.state.c01s02.bathroom then
        dialog:load('bathroom')
      else
        dialog:load('coffee')
      end
    
    end
    
  },
  
  apartmentDoorOpened = {
    onClick = function ()
      game.currentScene:stopRendering ( 'apartmentDoorOpened' )
      game.currentScene:startRendering ( 'apartmentDoor' )
    end
  },

  flyer = {
    avoid_clicks = true,
    render_at_start = not stateManager.state.c01s02.pickedFlyer
  },
  
  -- -----------------------------------------------------------------
  -- End Nancy Puzzle
  -- -----------------------------------------------------------------
  
}
