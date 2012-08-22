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

c01s02.frontCharacterZoom = 0.001
c01s02.bottomCharacterZoomThreshold = -611

c01s02.backCharacterZoom = 0.001
c01s02.topCharacterZoomThreshold = 323


objects = {
  background = {
    resource_name = 'c01s02_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    avoid_clicks = true
  },
  
  coffee_maker = {
    resource_name = 'c01s02_coffeemaker',
    layer_name = 'objects',
    x = 374,
    y = 270,
    render_at_start = true,
    onClick = function () 
      print ( "CoffeeMaker" )
    end
  },

  table = {
    resource_name = 'c01s02_table',
    layer_name = 'walk_behind',
    x = -196,
    y = -452,
    render_at_start = true
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
    y = -447,
    render_at_start = true
  },

  television = {
    resource_name = 'c01s02_tv',
    layer_name = 'walk_behind',
    x = 1233,
    y = -664,
    render_at_start = true
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
  }
}

c01s02:addObjects ( objects )

function c01s02:beforeInitialize ()
  self:loadObjects ()
  self:loadCharacter( mainCharacter )
  self.objects.main_character:setLoc(1120, -245)
  self:startRendering( 'main_character' )
end

-- 
function c01s02:afterInitialize ()  
  self.objects.answering_machine.animation:startAnimation ( 'blink' )
  
--   game.autoFollow = true
--   -- if DEBUG then
--   --   MOAILogMgr.log ( "---------------------------------" )
--   --   MOAILogMgr.log ( "Objects" )
--   --   MOAILogMgr.log ( "---------------------------------" )
--   --   --dump ( c01s02.objects )
--   --   MOAILogMgr.log ( "---------------------------------\n" )
--   --   
--   -- end
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
