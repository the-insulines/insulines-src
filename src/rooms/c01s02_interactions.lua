objectInteractions = {

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
      c01s01.initialCharacterPathNode = 'door'
      c01s01.initialCameraPathNode = 'door'
      
      game:switchToScene ( c01s01 )
    end
  },
  
  television = {
    onClick = function ()
      dialog:load('tv')
    end
  },

  answering_machine = {
    answered = false,

    onClick = function ()
      c01s02.objects.answering_machine.animation:stopCurrentAnimation()
      c01s02.objects.answering_machine.animation:startAnimation ( 'stopped' )
      c01s02.objects.answering_machine.answered = true
      dialog:load("message")
    end
  },
  
  -- ------------------------------------------------------
  -- Bathroom Puzzle
  -- ------------------------------------------------------
  
  bathroom_closed = {
    visitedBathroom = false,
    onClick = function ()
      if not c01s02.objects.bathroom_closed.visitedBathroom then
        -- Avoid clicks
        c01s02.inputEnabled = false
        
        c01s02.objects.bathroom_closed.visitedBathroom = true
        
        -- Open bathroom door
        c01s02:stopRendering('bathroom_closed')
        c01s02:startRendering('bathroom_opened')
        -- Move character to bathroom
        c01s02:moveCharacterToNode('josh', 'bathroom', c01s02.objects.bathroom_opened.inBathroom, c01s02)
      else
        dialog:load('bathroom_' .. math.random(2))
      end
    end
  },
  
  bathroom_opened = {
    inBathroom = function ( self )

      -- Close bathroom door
      c01s02:stopRendering("josh")
      c01s02:stopRendering("bathroom_opened")
      c01s02:startRendering("bathroom_closed")
      
      if not inventory.opened then
        inventory:openInventory ()
      end
      c01s02.inputEnabled = true      
      performWithDelay(10, self.objects.bathroom_opened.addBathroomItems, 1, self)

    end,
    
    addBathroomItems = function ( self )
      inventory:addItem( 'toothpaste', c01s02.objects.toothpaste )
      inventory:addItem( 'toothbrush', c01s02.objects.toothbrush )
      inventory:addItem( 'floss', c01s02.objects.floss )
    end,
    
    leaveBathroom = function ( self )
      inventory:findAndRemoveItem('toothbrush_with_toothpaste')
      
      if inventory.opened then
        inventory:closeInventory ()
      end
    
      c01s02:stopRendering("bathroom_opened")
      c01s02:startRendering("bathroom_closed")
      dialog:load('left_bathroom')
      c01s02.inputEnabled = true
      c01s02.characterMovement = true
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
    
      inventory:addItem ( 'toothbrush_with_toothpaste', c01s02.objects.toothbrush_with_toothpaste )
      
      c01s02.inputEnabled = false
      
      performWithDelay ( 50, c01s02.sounds.toothbrush.play, 1, c01s02.sounds.toothbrush )

      performWithDelay ( 800, c01s02.sounds.flush.play, 1, c01s02.sounds.flush )
      
      if inventory.opened then
        inventory:closeInventory ()
      end
      
      c01s02.inputEnabled = false

      performWithDelay ( 1150, c01s02.stopRendering, 1, c01s02, "bathroom_closed" )
      performWithDelay ( 1150, c01s02.startRendering, 1, c01s02, "bathroom_opened" )
      performWithDelay ( 1150, c01s02.startRendering, 1, c01s02, "josh" )
      performWithDelay ( 1150, c01s02.moveCharacterToNode, 1, c01s02, 'josh', 'bathroomDoor', c01s02.objects.bathroom_opened.leaveBathroom, c01s02 )
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
      c01s02:stopRendering('freezer_opened')
      c01s02:startRendering('freezer_closed')
      -- c01s02:stopRendering('cube_tray')
    end
  },

  fridge_opened = {
    onClick = function ()
      c01s02:stopRendering('fridge_opened')
      c01s02:startRendering('fridge_closed')
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
    hasCoffee = false,
    hasWater = false,
    madeCoffee = false,
    onClick = function ()
      dialog:load ( 'coffeemaker' )
    end,
    prepareCoffee = function ( self )
      local fadeIn = function ()
        c01s02:fadeIn ()
        self.animation:startAnimation ( 'coffeemaker_used' )
        c01s02:stopRendering ( 'coffeePotEmpty' )
        c01s02:startRendering ( "coffeePotFull" )
        c01s02.objects.mug_full.animation:startAnimation ( 'mug_full_smoke' )
        c01s02.objects.mug_full.highlight = true
        c01s02:startRendering ( "mug_full" )
        self.madeCoffee = true
        c01s02.objects.coffeeMaker.highlight = false
      end
      
      c01s02:fadeOut ()
      performWithDelay ( 100, fadeIn, 1, self )
    end,
    onInteractionWith = function ( self, item )
      if item.key == 'coffeePackage' then
        if not self.has_coffee then
          -- TODO: How to give feedback when coffee is used?
          self.hasCoffee = true
          inventory:removeItem( item )
          -- display the coffee loaded sprite
          self.animation:startAnimation ( 'coffeemaker_loaded' )
        end
        
        if self.hasWater then
          self:prepareCoffee ()
        end
      end
      
      if item.key == 'coffeePotEmpty' then
        dialog:load ( "fill_coffee_pot_first" )
      end
      
      if item.key == 'coffeePotWater' then
        self.hasWater = true
        inventory:removeItem ( item )
        
        -- place the empty pot on the coffee maker
        c01s02.objects.coffeePotEmpty.prop:setLoc ( self.x - 7, self.y - 78 )
        c01s02.objects.coffeePotEmpty.onClick = nil
        c01s02:startRendering ( 'coffeePotEmpty' )
        
        if self.hasCoffee then
          self:prepareCoffee ()
        end
      end
    end
  },
  
  pantry_closed = {
    onClick = function ()
      c01s02:stopRendering ( 'pantry_closed' )
      c01s02:startRendering ( 'pantry_opened' )
      if not c01s02.objects.coffeePackage.pickedUp then
        c01s02:startRendering ( 'coffeePackage' )
      end
    end
  },
  
  pantry_opened = {
    onClick = function ()
      if not c01s02.objects.coffeePackage.pickedUp then
        c01s02:stopRendering ( 'coffeePackage' )
        inventory:addItem ( "coffeePackage", c01s02.objects.coffeePackage )
        c01s02.objects.coffeePackage.pickedUp = true
      else
        c01s02:stopRendering ( 'pantry_opened' )
        c01s02:startRendering ( 'pantry_closed' )
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
      inventory:addItem ( 'coffeePotEmpty', c01s02.objects.coffeePotEmpty)
      c01s02:stopRendering('coffeePotEmpty')
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
      c01s02.objects.mug_full.animation:stopCurrentAnimation ()
      c01s02:stopRendering( 'mug_full' )
      c01s02:startRendering( 'mug_empty' )
      c01s02.objects.coffeeMaker.hadCoffee = true
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
      c01s02.objects.sink.animation:startAnimation ( 'stopped' )
      c01s02.objects.sink.flowing = false
    end,
    
    startFlowing = function ()
      c01s02.objects.sink.animation:startAnimation ( 'flowing' )
      c01s02.objects.sink.flowing = true
      performWithDelay (450, c01s02.objects.sink.stopFlowing, 1)
      c01s02.sounds.sink_flowing:play ()
    end,
    
    onInteractionWith = function ( self, item )
      if c01s02.objects.coffeePotEmpty.water then
        dialog:load("coffee_pot_with_water")
      else
        
        if not c01s02.objects.sink.flowing then
          c01s02.objects.sink.startFlowing ()
        end
        
        c01s02.objects.coffeePotEmpty.water = true
        inventory:removeItem(item)
        inventory:addItem('coffeePotWater', c01s02.objects.coffeePotWater)
      end
    end,
    
    flowing = false,
    
    onClick = function ()
      c01s02.objects.sink.animation:stopCurrentAnimation ()
      if c01s02.objects.sink.flowing then
        c01s02.objects.sink.stopFlowing ()
        c01s02.sounds.sink_flowing:stop ()
      else
        c01s02.objects.sink.startFlowing ()
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
    pickedFlyer = false,
    talkedToNancy = false,
    closeDoor = function ()
      c01s02:startRendering ( 'apartmentDoor' )
      c01s02:stopRendering ( 'apartmentDoorOpened' )
      
      -- characters look at each other
      c01s02.objects.josh:standLookingInDirection ( DIRECTION_RIGHT )
      c01s02.objects.nancy:standLookingInDirection ( DIRECTION_LEFT )
    end,
    
    beginNancy = function ()
      c01s02:stopRendering ( 'apartmentDoor' )
      c01s02:startRendering ( 'apartmentDoorOpened' )
      
      c01s02:loadCharacter ( nancy )
      local pos = c01s02.path.graph[c01s02.initialNancyPathNode].position
      c01s02.objects.nancy.prop:setLoc(pos.x, pos.y)
      c01s02.objects.nancy:moveTo(pos.x, pos.y, c01s02.perspectiveZoomFactor, 0.00001)
      c01s02:startRendering ( 'nancy' )
      c01s02:moveCharacterToNode('nancy', 'beforeDoor', c01s02.objects.apartmentDoor.closeDoor, c01s02)
      c01s02.objects.apartmentDoor.talkedToNancy = true
      
      stateManager.fair = true
      dialog:load('nancy')
    end,
    onClick = function ()
      if stateManager.pickedFlyer then
        
        if c01s02.objects.bathroom_closed.visitedBathroom and c01s02.objects.coffeeMaker.hadCoffee then
        
          if not c01s02.objects.apartmentDoor.talkedToNancy then
            c01s02.objects.apartmentDoor.beginNancy ()
          else
            c01s02:stopRendering ( 'apartmentDoor' )
            c01s02:startRendering ( 'apartmentDoorOpened' )
            
            game:switchToScene ( thankYouScreen )
          end
          
        else
          c01s02.objects.apartmentDoor:dialogRequirements ()
        end
      else
        -- pickup flyer
        stateManager.pickedFlyer = true
        c01s02:stopRendering('flyer')
        mapHUD:show ()
        -- inventory:addItem('flyer', c01s02.objects.flyer)
        dialog:load('flyer')
      end
    end,
    
    dialogRequirements = function ( self )
      if not c01s02.objects.bathroom_closed.visitedBathroom and not c01s02.objects.coffeeMaker.hadCoffee then
        dialog:load('bathroom_and_coffee')
      elseif not c01s02.objects.bathroom_closed.visitedBathroom then
        dialog:load('bathroom')
      else
        dialog:load('coffee')
      end
    
    end
    
  },
  
  apartmentDoorOpened = {
    onClick = function ()
      c01s02:stopRendering ( 'apartmentDoorOpened' )
      c01s02:startRendering ( 'apartmentDoor' )
    end
  },

  flyer = {
    avoid_clicks = true,
  },
  
  -- -----------------------------------------------------------------
  -- End Nancy Puzzle
  -- -----------------------------------------------------------------
  
}
