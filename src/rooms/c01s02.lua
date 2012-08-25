--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

c01s02 = room.new ( "c01s02" )

c01s02.initialCameraX = 700
c01s02.initialCameraY = 0
c01s02.initialCameraScl = 0.8

c01s02.frontCharacterZoom = 0.75
c01s02.bottomCharacterZoomThreshold = -611

c01s02.backCharacterZoom = 0.30
c01s02.topCharacterZoomThreshold = 323

c01s02.initialCharacterZoom = 0.85


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
      
      performWithDelay (100, game.loadScene, 1, game, c01s01)
      performWithDelay (100, c01s01.loadCharacter, 1, c01s01, mainCharacter)
      performWithDelay (110, c01s01.objects.main_character.moveTo, 1, c01s01.objects.main_character, -788, -120, c01s01.perspectiveZoomFactor, 0.001)
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
    interactsWith = { 'coffeePackage', 'coffeePotEmpty' },
    hasCoffee = false,
    hasWater = false,
    onClick = function ()
      if c01s02.objects.coffeeMaker.hasWater and c01s02.objects.coffeeMaker.hasCoffee then

        local fadeIn = function ()
          c01s02:fadeIn ()
          c01s02:startRendering ( "coffeePotFull" )
          c01s02:startRendering ( "mug_full" )
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
        if item.object.water then
          self.hasWater = true
          inventory:removeItem( item )
        else
          dialog:load("c01s02_fill_coffee_pot_first")
        end
      end
    end
  },
    
  pantry_closed = {
    resource_name = 'c01s02_pantry_closed',
    layer_name = 'objects',
    x = 572,
    y = 65,
    render_at_start = true,
    onClick = function ()
      c01s02:stopRendering ( 'pantry_closed' )
      c01s02:startRendering ( 'pantry_opened' )
      c01s02:startRendering ( 'coffeePackage' )
    end
  },
  
  pantry_opened = {
    resource_name = 'c01s02_pantry_opened',
    layer_name = 'objects',
    x = 563,
    y = 53,
    render_at_start = false,
    onClick = function ()
      if c01s02.objects.coffeePackage.rendering then
        c01s02:stopRendering ( 'coffeePackage' )
        inventory:addItem ( "coffeePackage", c01s02.objects.coffeePackage )
      end
    end
  },

  coffeePackage = {
    resource_name = 'c01s02_coffee',
    layer_name = 'objects',
    x = 563,
    y = 53,
    render_at_start = false
  },

  coffeePotEmpty = {
    resource_name = 'c01s02_coffee_pot_empty',
    layer_name = 'objects',
    x = 439,
    y = 178,
    render_at_start = true,
    water = false,
    onClick = function ()
      inventory:addItem ( 'coffeePotEmpty', c01s02.objects.coffeePotEmpty)
      c01s02:stopRendering('coffeePotEmpty')
    end,
    priority = 10
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
    
    onInteractionWith = function ( self, item )
      if c01s02.objects.coffeePotEmpty.water then
        dialog:load("c01s02_coffee_pot_with_water")
      else
        
        if not c01s02.objects.sink.flowing then
          c01s02.objects.sink.animation:startAnimation ( 'flowing' )
          c01s02.objects.sink.flowing = true
        end
        
        c01s02.objects.coffeePotEmpty.water = true
        
      end
    end,
    
    flowing = false,
    
    onClick = function ()
      c01s02.objects.sink.animation:stopCurrentAnimation ()
      if c01s02.objects.sink.flowing then
        c01s02.objects.sink.animation:startAnimation ( 'stopped' )
        c01s02.objects.sink.flowing = false
      else
        c01s02.objects.sink.animation:startAnimation ( 'flowing' )
        c01s02.objects.sink.flowing = true
      end
    end
  },
  
  -- ------------------------------------------------------
  -- End Coffee Puzzle
  -- ------------------------------------------------------
  
}

c01s02:addObjects ( objects )

function c01s02:beforeInitialize ()
  self:loadObjects ()
  self:loadCharacter( mainCharacter )
  self.objects.main_character:setLoc(1120, -245)
end

-- 
function c01s02:afterInitialize ()  
  self.objects.answering_machine.animation:startAnimation ( 'blink' )
  
--   game.autoFollow = true
  -- if DEBUG then
  --   MOAILogMgr.log ( "---------------------------------" )
  --   MOAILogMgr.log ( "Objects" )
  --   MOAILogMgr.log ( "---------------------------------" )
  --   dump ( c01s02.objects )
  --   MOAILogMgr.log ( "---------------------------------\n" )
  --   
  -- end
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
    neighbors = { 'kitchenLeft', 'kitchenRightOut' },
    offsets = { x = 500, y = 200, scl = 0.6 }
  },
  
  kitchenRightOut = {
    position = point (740, -26),
    neighbors = { 'livingNodeRight', 'kitchenRight' },
    offsets = { x = 600, y = 0, scl = 0.8 }
  },
  
  livingNodeRight = {
    position = point (645, -270),
    neighbors = { 'kitchenRightOut', 'joshDoor' },
  },
  
  joshDoor = {
    position = point (1130, -245),
    neighbors = { 'livingNodeRight', 'lamp' },
    offsets = { x = 900, y = 0, 0.8 }
  },

  lamp = {
    position = point (1387, -277),
    neighbors = { 'joshDoor', 'bathroomDoor' },
    offsets = { x = 990, y = 0, scl = 0.9 }
  },
  
  bathroomDoor = {
    position = point (1742, -459),
    neighbors = { 'lamp' },
    
  }

}

-- Walk path
c01s02:loadPath(path)
