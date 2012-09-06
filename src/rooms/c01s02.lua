--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

c01s02 = room.new ( "c01s02" )

c01s02.frontCharacterZoom = 0.9
c01s02.bottomCharacterZoomThreshold = -611

c01s02.backCharacterZoom = 0.70
c01s02.topCharacterZoomThreshold = 323

-- c01s02.initialCameraPathNode = 'joshDoor'
-- c01s02.initialCharacterPathNode = 'joshDoor'

c01s02.initialCameraPathNode = 'beforeBobbyDoor'
c01s02.initialCharacterPathNode = 'beforeBobbyDoor'

objects = {
  background = {
    resource_name = 'c01s02_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    avoid_clicks = true
  },
  
  table = {
    resource_name = 'c01s02_table',
    layer_name = 'walk_behind',
    x = -196,
    y = -452,
    render_at_start = true
  },

  bob_bedroom_closed = {
    resource_name = 'c01s02_bob_bedroom_closed',
    layer_name = 'objects',
    x = -676,
    y = 0,
    render_at_start = true,
    onClick = function ()
      dialog:load('locked')
    end
  },

  bedroom_opened = {
    resource_name = 'c01s02_bedroom_opened',
    layer_name = 'objects',
    x = 1120,
    y = -10,
    render_at_start = true,
    onClick = function ()
      c01s02:unload ()
      
      c01s01.initialCharacterPathNode = 'door'
      c01s01.initialCameraPathNode = 'door'
      
      performWithDelay (100, game.loadScene, 1, game, c01s01)
    end
  },
  
  blue_chairs = {
    resource_name = 'c01s02_chairs',
    layer_name = 'walk_behind',
    x = -170,
    y = -502,
    render_at_start = true
  },
  
  couch = {
    resource_name = 'c01s02_couch',
    layer_name = 'walk_behind',
    x = 1086,
    y = -427,
    render_at_start = true
  },

  television = {
    resource_name = 'c01s02_tv',
    layer_name = 'walk_behind',
    x = 1233,
    y = -664,
    render_at_start = true,
    renderPriority = 10
  },

  answering_machine = {
    resource_name = "c01s01_answering_machine",
    layer_name = "objects",
    highlight = true,
    animated = true,
    animations = {
      -- BUG:
      -- For some reason it's not working with { 'blink', 1, 2, 0.5 }
      -- even if the frameCount is 2
      { 'blink', 1, 3, 0.5 },
      { 'stopped', 1, 1, 0.1 }
    },
    x = -1280,
    y = -190,
    render_at_start = true,
    answered = false,

    onClick = function ()
      if not c01s02.objects.answering_machine.answered then
        c01s02.objects.answering_machine.animation:stopCurrentAnimation()
        c01s02.objects.answering_machine.animation:startAnimation ( 'stopped' )
        c01s02.objects.answering_machine.answered = true
        dialog:load("c01s02_answering_machine_message")
      end
    end
  },
  
  -- ------------------------------------------------------
  -- Bathroom Puzzle
  -- ------------------------------------------------------
  
  bathroom_closed = {
    resource_name = 'c01s02_bathroom_closed',
    layer_name = 'objects',
    x = 1798,
    y = -217,
    render_at_start = true,
    visitedBathroom = false,
    onClick = function ()
      if not c01s02.objects.bathroom_closed.visitedBathroom then
        -- TODO: Should we avoid clicks now?
        c01s02.objects.bathroom_closed.visitedBathroom = true
        
        -- Open bathroom door
        c01s02:stopRendering('bathroom_closed')
        c01s02:startRendering('bathroom_opened')
        -- Move character to bathroom
        c01s02:moveCharacterToNode('bathroom', c01s02.objects.bathroom_opened.inBathroom, c01s02)
      end
    end
  },
  
  bathroom_opened = {
    resource_name = 'c01s02_bathroom_opened',
    layer_name = 'walk_behind',
    x = 1780,
    y = -250,
    render_at_start = false,

    inBathroom = function ( self )

      -- Close bathroom door
      c01s02:stopRendering("main_character")
      c01s02:stopRendering("bathroom_opened")
      c01s02:startRendering("bathroom_closed")
      inventory:openInventory ()
      performWithDelay(10, self.objects.bathroom_opened.addBathroomItems, 1, self)
    end,
    
    addBathroomItems = function ( self )
      inventory:addItem( 'toothpaste', c01s02.objects.toothpaste )
      inventory:addItem( 'toothbrush', c01s02.objects.toothbrush )
      inventory:addItem( 'floss', c01s02.objects.floss )
    end
    
  },
  
  toothpaste = {
    inventory_resource_name = "inventory_toothpaste",
    render_at_start = false,
    interactsWith = { 'toothbrush' },
    onInteractionWith = function ( self, item )
      inventory:removeItem(item)
      if self.invTarget then
        inventory:removeItem(self.invTarget)
      else
        inventory:removeItem(self)
      end
      inventory:addItem( 'toothbrush_with_toothpaste', c01s02.objects.toothbrush_with_toothpaste )
    end
  },
  
  toothbrush = {
    inventory_resource_name = "inventory_toothbrush",
    render_at_start = false,
    interactsWith = { 'toothpaste' },
    onInteractionWith = function ( self, item )
      if item.key == 'toothpaste' then
        item.object.onInteractionWith(item, self.invTarget )
      end
    end
  },

  toothbrush_with_toothpaste = {
    inventory_resource_name = "inventory_toothbrush_with_toothpaste",
    render_at_start = false,
  },
  
  floss = {
    inventory_resource_name = "inventory_floss",
    render_at_start = false
  },
  
  -- ------------------------------------------------------
  -- End Bathroom Puzzle
  -- ------------------------------------------------------
  
  -- ------------------------------------------------------
  -- Fridge
  -- ------------------------------------------------------
  
  freezer_closed = {
    resource_name = 'c01s02_freezer_closed',
    layer_name = 'objects',
    x = 752,
    y = 296,
    renderPriority = 100,
    render_at_start = true,
    highlight = true,
    onClick = function ()
      c01s02:stopRendering('freezer_closed')
      c01s02:startRendering('freezer_opened')
      -- c01s02:startRendering('cube_tray')
    end
  },

  freezer_opened = {
    resource_name = 'c01s02_freezer_opened',
    layer_name = 'objects',
    x = 754,
    y = 277,
    renderPriority = 100,
    render_at_start = false,
    highlight = true,
    onClick = function ()
      c01s02:stopRendering('freezer_opened')
      c01s02:startRendering('freezer_closed')
      -- c01s02:stopRendering('cube_tray')
    end
  },

  cube_tray = {
    resource_name = 'c01s02_cube_tray',
    layer_name = 'objects',
    x = 710,
    y = 298,
    renderPriority = 200,
    render_at_start = false,
    highlight = true,
    onClick = function ()
      c01s02:stopRendering('cube_tray')
      inventory:addItem('cube_tray', c01s02.objects.cube_tray)
    end
  },

  fridge_closed = {
    resource_name = 'c01s02_fridge_closed',
    layer_name = 'objects',
    x = 751,
    y = 129,
    render_at_start = true,
    highlight = true,
    onClick = function ()
      c01s02:stopRendering('fridge_closed')
      c01s02:startRendering('fridge_opened')
    end
  },  

  fridge_opened = {
    resource_name = 'c01s02_fridge_opened',
    layer_name = 'objects',
    x = 751,
    y = 108,
    render_at_start = false,
    highlight = true,
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
    resource_name = 'c01s02_coffeemaker',
    layer_name = 'objects',
    x = 374,
    y = 270,
    render_at_start = true,
    -- onClick = function () 
    -- end,
    interactsWith = { 'coffeePackage', 'coffeePotEmpty', 'coffeePotWater' },
    highlight = true,
    hasCoffee = false,
    hasWater = false,
    madeCoffee = false,
    onClick = function ()
      if c01s02.objects.coffeeMaker.hasWater and c01s02.objects.coffeeMaker.hasCoffee and not c01s02.objects.coffeeMaker.madeCoffee then

        local fadeIn = function ()
          c01s02:fadeIn ()
          c01s02:startRendering ( "coffeePotFull" )
          c01s02:startRendering ( "mug_full" )
          c01s02.objects.coffeeMaker.madeCoffee = true
        end
        
        c01s02:fadeOut ()
        performWithDelay (100, fadeIn, 1, c01s02)

      end
    end,
    
    onInteractionWith = function ( self, item )
      if item.key == 'coffeePackage' then
        if not self.has_coffee then
          -- TODO: How to give feedback when coffee is used?
          self.hasCoffee = true
          inventory:removeItem( item )
        end
      end
      
      if item.key == 'coffeePotEmpty' then
        dialog:load("c01s02_fill_coffee_pot_first")
      end
      
      if item.key == 'coffeePotWater' then
        self.hasWater = true
        inventory:removeItem( item )
      end
    end
  },
    
  pantry_closed = {
    resource_name = 'c01s02_pantry_closed',
    layer_name = 'objects',
    x = 572,
    y = 65,
    render_at_start = true,
    highlight = true,
    onClick = function ()
      c01s02:stopRendering ( 'pantry_closed' )
      c01s02:startRendering ( 'pantry_opened' )
      if not c01s02.objects.coffeePackage.pickedUp then
        c01s02:startRendering ( 'coffeePackage' )
      end
    end
  },
  
  pantry_opened = {
    resource_name = 'c01s02_pantry_opened',
    layer_name = 'objects',
    x = 563,
    y = 53,
    render_at_start = false,
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
    resource_name = 'c01s02_coffee',
    inventory_resource_name = "inventory_coffee",
    layer_name = 'objects',
    x = 563,
    y = 53,
    pickedUp = false,
    render_at_start = false,
    highlight = true,
    avoid_clicks = true
  },

  coffeePotEmpty = {
    resource_name = 'c01s02_coffee_pot_empty',
    inventory_resource_name = "inventory_coffee_pot_empty",
    layer_name = 'objects',
    x = 439,
    y = 178,
    highlight = true,
    render_at_start = true,
    water = false,
    onClick = function ()
      inventory:addItem ( 'coffeePotEmpty', c01s02.objects.coffeePotEmpty)
      c01s02:stopRendering('coffeePotEmpty')
    end,
    priority = 10
  },

  coffeePotWater = {
    inventory_resource_name = "inventory_coffee_pot_water",
  },

  coffeePotFull = {
    resource_name = 'c01s02_coffee_pot_full',
    layer_name = 'objects',
    x = 439,
    y = 178,
    render_at_start = false,
    onClick = function ()
      dialog:load('c01s02_coffee_pot_full')
    end
  },
  
  mug_full = {
    resource_name = 'c01s02_mug_full',
    layer_name = 'objects',
    x = 350,
    y = 178,
    render_at_start = false,
    onClick = function ()
      dialog:load("c01s02_mug_full")
      c01s02:stopRendering( 'mug_full' )
      c01s02:startRendering( 'mug_empty' )
    end
  },

  mug_empty = {
    resource_name = 'c01s02_mug_empty',
    layer_name = 'objects',
    x = 350,
    y = 178,
    render_at_start = false,
    onClick = function ()
      dialog:load("c01s02_stole_mug")
    end
  },
  
  sink = {
    resource_name = "c01s02_sink",
    layer_name = "objects",
    x = 555,
    y = 195,
    render_at_start = true,
    animated = true,
    animations = {
      { 'stopped', 1, 1, 0.1 },
      { 'flowing', 2, 1, 0.1 }
    },
    
    interactsWith = { 'coffeePotEmpty' },
    highlight = true,
    
    stopFlowing = function ()
      c01s02.objects.sink.animation:startAnimation ( 'stopped' )
      c01s02.objects.sink.flowing = false
    end,
    
    startFlowing = function ()
      c01s02.objects.sink.animation:startAnimation ( 'flowing' )
      c01s02.objects.sink.flowing = true
      performWithDelay (200, c01s02.objects.sink.stopFlowing, 1)
    end,
    
    onInteractionWith = function ( self, item )
      if c01s02.objects.coffeePotEmpty.water then
        dialog:load("c01s02_coffee_pot_with_water")
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
      else
        c01s02.objects.sink.startFlowing ()
      end
    end
  },
  
  -- ------------------------------------------------------
  -- End Coffee Puzzle
  -- ------------------------------------------------------
  
}

c01s02:addObjects ( objects )

sounds = {
  
  sink_flowing = {
    resource_name = 'c01s02_sink_flowing'
  },
  
  cellphone = {
    resource_name = 'c01s01_cellphone_ringtone'
  },
  
  background = {
    resource_name = 'c01s01_theme'
  }
  
}

c01s02:addSounds( sounds )

function c01s02:beforeInitialize ()
  self:loadObjects ()
  self:loadSounds ()
  self:loadCharacter( mainCharacter )
  self.objects.main_character:setLoc(1120, -245)
end

function c01s02:afterInitialize ()  
  self.objects.answering_machine.animation:startAnimation ( 'blink' )
  c01s02.sounds.sink_flowing:play ()
  
end

local path = {
  livingNodeLeft = {
    position = point (-398, -340),
    neighbors = { 'beforeBobbyDoor', 'kitchenLeftOut' },
    offsets = { x = -190, y = 0 }
  },
  
  beforeBobbyDoor = {
    position = point (-711, -350),
    neighbors = { 'livingNodeLeft', 'carpet', 'bobbyDoor' },
    offsets = { x = -850, y = 0 }
  },

  bobbyDoor = {
    position = point (-690, -237),
    neighbors = { 'beforeBobbyDoor' },
  },

  carpet = {
    position = point (-873, -343),
    neighbors = { 'beforeBobbyDoor', 'beforeAnswering' },
  },

  beforeAnswering = {
    position = point (-1016, -408),
    neighbors = { 'carpet', 'beforeDoor', 'answering' },
  },

  answering = {
    position = point (-1172, -341),
    neighbors = { 'beforeAnswering', 'beforeDoor' },
  },

  beforeDoor = {
    position = point (-1251, -500),
    neighbors = { 'beforeAnswering', 'door', 'answering' },
  },
  
  door = {
    position = point (-1538, -500),
    neighbors = { 'beforeDoor' },
  },
  
  kitchenLeft = {
    position = point (117, -26),
    neighbors = { 'kitchenLeftOut', 'kitchenRight' },
    offsets = { x = 400, y = 200, scl = 0.6 }
  },

  kitchenLeftOut = {
    position = point (114, -29),
    neighbors = { 'livingNodeLeft', 'kitchenLeft' },
    offsets = { x = -190, y = 0, scl = 0.9 }
  },

  kitchenRight = {
    position = point (737, -26),
    neighbors = { 'kitchenLeft', 'zoomKitchenRight' },
  },
  
  zoomKitchenRight = {
    position = point (728, -60),
    neighbors = { 'kitchenRight', 'zoomKitchenRightOut' },
    offsets = { x = 500, y = 200, scl = 0.6 }   
  },
  
  zoomKitchenRightOut = {
    position = point (720, -90),
    neighbors = { 'zoomKitchenRight', 'livingNodeRight' },
    offsets = { x = 900, y = 0, scl = 0.9 }
  },
  
  livingNodeRight = {
    position = point (645, -270),
    neighbors = { 'zoomKitchenRightOut', 'joshDoor' },
  },
  
  joshDoor = {
    position = point (1130, -245),
    neighbors = { 'livingNodeRight', 'lamp' },
    offsets = { x = 900, y = 0, scl = 0.9 }
  },

  lamp = {
    position = point (1387, -277),
    neighbors = { 'joshDoor', 'bathroomDoor' },
    offsets = { x = 990, y = 0, scl = 0.9 }
  },
  
  bathroomDoor = {
    position = point (1742, -429),
    neighbors = { 'lamp', 'bathroom' },
    
  },

  bathroom = {
    position = point (1842, -429),
    neighbors = { 'bathroomDoor' },
  }

}

-- Walk path
c01s02:loadPath(path)
