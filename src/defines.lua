--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

-- MOAIDebugLines.showStyle ( MOAIDebugLines.PROP_MODEL_BOUNDS )
-- MOAIDebugLines.showStyle ( MOAIDebugLines.TEXT_BOX )

-- Debugging
DEBUG = false
-- DEBUG = true


-- Locale
LOCALE_LIST = {'es_AR', 'en_US'}

LOCALE = 'en_US'


-- Viewport constants
WORLD_RESOLUTION_X = 1920
WORLD_RESOLUTION_Y = 1280

SCREEN_RESOLUTION_X = 960
SCREEN_RESOLUTION_Y = 640


MAIN_CHARACTER_PIVOT = -280
MAIN_CHARACTER_TEXT_LOCATION_OFFSET = { x = 0, y = MAIN_CHARACTER_PIVOT * 2 }

-- Camera
CAMERA_SCALE = 1.0

CAMERA_MIN_MOVEMENT_X = -2
CAMERA_MIN_MOVEMENT_Y = -2
CAMERA_MAX_MOVEMENT_X = 2
CAMERA_MAX_MOVEMENT_Y = 2
CAMERA_MOVEMENT_DIRECTION_CHANGE_PROBABILITY = 0.5
CAMERA_MAX_DELTA_X = 10 + 5
CAMERA_MAX_DELTA_Y = 15 + 5
CAMERA_MOVEMENT_DURATION = 1.6

-- Animations
JOSH_SLEEPING_SECONDS_PER_FRAME = 0.1
JOSH_WAKES_SECONDS_PER_FRAME = 0.10
JOSH_GRABS_CELLPHONE_SECONDS_PER_FRAME = 0.08

-- Dialog
DIALOG_ACTION_CLOSE = 0
DIALOG_ACTION_REDIRECT = 1
DEFAULT_DIALOG_COLOR = { 1, 1, 1, 1 }
DEFAULT_OPTION_COLOR = { 1, 1, 1, 1 }
MAIN_CHARACTER_DIALOG_COLOR = { 0.36, 0.53, 0.77, 1 }
MAIN_CHARACTER_DIALOG_SHADOW_OFFSET = { x = -3, y = -3 }

-- Inventory constants
INVENTORY_WIDTH = 566
INVENTORY_HEIGHT = WORLD_RESOLUTION_Y
INVENTORY_HALF_WIDTH = INVENTORY_WIDTH / 2
INVENTORY_HALF_HEIGHT = INVENTORY_HEIGHT / 2
INVENTORY_OPEN_X = SCREEN_RESOLUTION_X - INVENTORY_HALF_WIDTH
INVENTORY_OPEN_Y = 0
INVENTORY_OPEN_DELTA_X = - INVENTORY_WIDTH
INVENTORY_OPEN_DELTA_Y = 0

INVENTORY_CLOSED_X = SCREEN_RESOLUTION_X + INVENTORY_HALF_WIDTH
INVENTORY_CLOSED_Y = 0
INVENTORY_ANIMATION_LENGTH = 1

INVENTORY_BACKPACK_WIDTH = 89
INVENTORY_BACKPACK_HEIGHT = 89
INVENTORY_BACKPACK_HALF_WIDTH = INVENTORY_BACKPACK_WIDTH / 2
INVENTORY_BACKPACK_HALF_HEIGHT = INVENTORY_BACKPACK_HEIGHT / 2
INVENTORY_BACKPACK_POSITION_X = ( WORLD_RESOLUTION_X / 2 ) - ( INVENTORY_BACKPACK_HALF_WIDTH ) - 20
INVENTORY_BACKPACK_POSITION_Y = ( WORLD_RESOLUTION_Y / 2 ) - ( INVENTORY_BACKPACK_HALF_HEIGHT ) - 20

INVENTORY_ITEMS_TOP = WORLD_RESOLUTION_Y / 2 - 120

INVENTORY_ITEM_WIDTH = 176
INVENTORY_ITEM_HEIGHT = 176
INVENTORY_ITEM_MARGIN = 10
INVENTORY_ITEM_VERTICAL_MARGIN = INVENTORY_ITEM_MARGIN * 4
INVENTORY_ITEM_HALF_WIDTH = INVENTORY_ITEM_WIDTH / 2
INVENTORY_ITEM_HALF_HEIGHT = INVENTORY_ITEM_HEIGHT / 2


-- HIGHLIGHT
HIGHLIGHT_COLOR = { r = 0.92, g = 1, b = 0, a = 0.5 }
HIGHLIGHT_TIME = 0.5


-- DIALOG
DIALOG_BACKGROUND_WIDTH = 1920
DIALOG_BACKGROUND_HEIGHT = 1280
DIALOG_BACKGROUND_HALF_WIDTH = DIALOG_BACKGROUND_WIDTH / 2
DIALOG_BACKGROUND_HALF_HEIGHT = DIALOG_BACKGROUND_HEIGHT / 2

DIALOG_WINDOW_WIDTH = 1740
DIALOG_WINDOW_HEIGHT = 864
DIALOG_WINDOW_HALF_WIDTH = DIALOG_WINDOW_WIDTH / 2
DIALOG_WINDOW_HALF_HEIGHT = DIALOG_WINDOW_HEIGHT / 2

-- Language
LANGUAGE = "en"


-- Movement
MOVEMENT_PIXELS_PER_SECOND = 200
MOVEMENT_SECONDS_PER_FRAME = 0.1

-- Resources

-- resource type constants
IMAGES_PATH = '../../insulines-gfx/'
-- IMAGES_PATH = './'

TILED_IMAGES_PATH = IMAGES_PATH
ANIMATION_FRAMES_PATH = IMAGES_PATH
FONTS_PATH = IMAGES_PATH .. 'fonts/'
SOUNDS_PATH = IMAGES_PATH .. 'sounds/'

RESOURCE_TYPE_IMAGE = 0
RESOURCE_TYPE_TILED_IMAGE = 1
RESOURCE_TYPE_ANIMATION_FRAMES = 2
RESOURCE_TYPE_FONT = 3
RESOURCE_TYPE_SOUND = 4


resources = {
  
  debug_font = {
    type = RESOURCE_TYPE_FONT,
    fileName = 'arialbd.ttf',
    glyphs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?!",
    fontSize = 26,
    dpi = 160
  },

  dialog_font = {
    type = RESOURCE_TYPE_FONT,
    fileName = 'minya nouvelle bd.ttf',
    glyphs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?!", 
    fontSize = 50,
    dpi = 160
  },

  hitchcock = {
    type = RESOURCE_TYPE_FONT,
    fileName = 'hitchcock.ttf',
    glyphs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?!",
    fontSize = 40,
    dpi = 160
  },
  
  inventory_background = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'hud/inventory_background.png', 
    width = 566, height = 1280, 
  },
  
  inventory_backpack = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/backpack.png',
    width = 89, height = 89,
  },

  inventory_cellphone = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_cellphone.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },

  inventory_coffee_pot_empty = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_coffee_pot_empty.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },

  inventory_coffee_pot_water = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_coffee_pot_water.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },

  inventory_floss = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_floss.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },

  inventory_toothbrush = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_toothbrush.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },

  inventory_toothpaste = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_toothpaste.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },

  inventory_coffee = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_coffee.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },
  
  inventory_toothbrush_with_toothpaste = {
    type = RESOURCE_TYPE_IMAGE,
    fileName = 'hud/inventory_toothbrush_with_toothpaste.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT,
  },

  highlight_duck = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'hud/clickeables_off.png', 
    width = 89, height = 89, 
  },

  inventory_item_background = {
    type = RESOURCE_TYPE_TILED_IMAGE,
    fileName = 'inventory_item_bkg.png',
    width = INVENTORY_ITEM_WIDTH, height = INVENTORY_ITEM_HEIGHT * 3,
    tileMapSize = {1, 3}
  },

  dialog_window_background = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'hud/dialog_window_background.png', 
    width = DIALOG_BACKGROUND_WIDTH, height = DIALOG_BACKGROUND_HEIGHT,
  },

  dialog_background = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'hud/dialog_background.png', 
    width = DIALOG_WINDOW_WIDTH, height = DIALOG_WINDOW_HEIGHT,
  },

  dialog_option_background = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'dialog_option_background.png', 
    width = 455, height = 182, 
  },
  
  -- /////////////////////////////////////////////////////////////
  --
  -- characters
  --
  -- ////////////////////////////////////////////////////////////

  main_character = {
    type = RESOURCE_TYPE_ANIMATION_FRAMES,
    location = 'characters/josh/',
    
    pivotX = 0,
    pivotY = MAIN_CHARACTER_PIVOT,
    
    animations = {
      
      walk_right = {
        fileName = 'josh_walk_side',
        frameCount = 8,
        frameTime = MOVEMENT_SECONDS_PER_FRAME,
        startFrame = 1,
      },
      
      walk_left = {
        fileName = 'josh_walk_side_flip',
        frameCount = 8,
        frameTime = MOVEMENT_SECONDS_PER_FRAME,
        startFrame = 1,
      },
      walk_front = {
        fileName = 'josh_walk_front',
        frameCount = 8,
        frameTime = MOVEMENT_SECONDS_PER_FRAME,
        startFrame = 1,
      },
      walk_back = {
        fileName = 'josh_walk_back',
        frameCount = 8,
        frameTime = MOVEMENT_SECONDS_PER_FRAME,
        startFrame = 1,
      },
      
    },
    width = 828 / 3, height = 1930 / 3,
  },
  
  nancy = {
    type = RESOURCE_TYPE_ANIMATION_FRAMES,
    location = 'characters/nancy/',
    
    pivotX = 0,
    pivotY = MAIN_CHARACTER_PIVOT,
    
    animations = {
      walk_side = {
        fileName = 'nancy_walk_cycle_side',
        frameCount = 8,
        frameTime = MOVEMENT_SECONDS_PER_FRAME,
      },
    },
    width = 828 / 3, height = 1930 / 3,
  },
  
  -- /////////////////////////////////////////////////////////////
  --
  -- c01s01
  --
  -- ////////////////////////////////////////////////////////////

  josh_sleeping = {
    type = RESOURCE_TYPE_ANIMATION_FRAMES,
    location = 'characters/josh/',
    pivotX = 0,
    pivotY = 0,
    animations = {
      sleeps = {
        fileName = 'josh_sleeping',
        startFrame = 1,
        frameCount = 75,
        frameTime = JOSH_SLEEPING_SECONDS_PER_FRAME,
        width = 800, height = 500
      },
    },
    sounds = {
      sleeps = {
        { fileName = 'snoring', volume = 1, startFrame = 31 }
      }
    },
    width = 800, height = 500
  },

  josh_grabs_cellphone = {
    type = RESOURCE_TYPE_ANIMATION_FRAMES,
    location = 'characters/josh/',
    pivotX = 0,
    pivotY = 0,
    animations = {
      grabs_cellphone = {
        fileName = 'josh_grabs_cellphone',
        startFrame = 1,
        frameCount = 30,
        frameTime = JOSH_GRABS_CELLPHONE_SECONDS_PER_FRAME,
        mode = MOAITimer.NORMAL
      },
      
      grabs_cellphone_loop = {
        parentAnimationName = 'grabs_cellphone',
        startFrame = 6,
        frameCount = 24,
        frameTime = JOSH_GRABS_CELLPHONE_SECONDS_PER_FRAME,
        mode = MOAITimer.NORMAL
      },
      
      still = {
        parentAnimationName = 'grabs_cellphone',
        startFrame = 30,
        frameCount = 1,
        frameTime = JOSH_GRABS_CELLPHONE_SECONDS_PER_FRAME,
        mode = MOAITimer.NORMAL
      },
    
    },
    width = 920, height = 420
  },

  josh_wakes_up = {
    type = RESOURCE_TYPE_ANIMATION_FRAMES,
    location = 'characters/josh/',
    pivotX = 0,
    pivotY = 0,
    animations = {
      wakes_up = {
        fileName = 'josh_wakes_up',
        startFrame = 1,
        frameCount = 30,
        frameTime = JOSH_WAKES_SECONDS_PER_FRAME,
        mode = MOAITimer.NORMAL
      },
      
      still = {
        parentAnimationName = 'wakes_up',
        startFrame = 30,
        frameCount = 1,
        frameTime = JOSH_WAKES_SECONDS_PER_FRAME,
        mode = MOAITimer.NORMAL
      },
    
    },
    sounds = {
      wakes_up = {
        { fileName = 'yawn', volume = 1, startFrame = 16 }
      }
    },
    
    width = 700, height = 600
    
  },

  c01s01_background = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/c01s01_background_B.png', 
    width = 1920, 
    height = 1080
  },

  c01s01_theme = {
    type = RESOURCE_TYPE_SOUND, 
    fileName = 'c01s01/theme.mp3', 
    loop = true,
    volume = 0.6
  },

  c01s01_ambient = {
    type = RESOURCE_TYPE_SOUND, 
    fileName = 'c01s01/ambient.mp3', 
    loop = true,
    volume = 0.2
  },
    
  c01s01_cellphone = {
    type = RESOURCE_TYPE_TILED_IMAGE, 
    fileName = 'c01s01/cellphone/cellphone_ring.png', 
    width = 1100, height = 100,
    tileMapSize = {11, 1}
  },

  c01s01_cellphone_ringtone = {
    type = RESOURCE_TYPE_SOUND, 
    fileName = 'c01s01/cellphone/ringtone_loop_short.wav', 
    loop = true,
    volume = 0.6
  },

  c01s01_nightstand = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/nightstand.png', 
    width = 163, height = 173
  },
  
  c01s01_clothes_heap = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/clothes_heap.png', 
    width = 477, height = 273
  },

  c01s01_clothes_on_heap = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/clothes_on_heap.png', 
    width = 220,
    height = 273
  },
  
  c01s01_window = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/window.png', 
    width = 481, 
    height = 895
  },
  
  c01s01_room_door = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/room_door.png', 
    width = 182, 
    height = 608
  },

  c01s01_room_door_open = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/room_door_open.png', 
    width = 173, 
    height = 641
  },
  
  c01s01_walk_behind = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/c01s01_walk_behind_B.png', 
    width = 977, 
    height = 308
  },
  
  c01s01_poster_barbarullo = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/c01s01_poster_barbarullo.png', 
    width = 180, 
    height = 200
  },
  c01s01_poster_star_floyd = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/c01s01_poster_star_floyd.png', 
    width = 219, 
    height = 302
  },
  
  -- /////////////////////////////////////////////////////////////
  --
  -- c01s02
  --
  -- ////////////////////////////////////////////////////////////
  
  c01s02_background = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_background.png', 
    width = 3720, 
    height = 1467
  },

  c01s02_bob_bedroom_closed = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_bob_bedroom_closed.png', 
    width = 226, 
    height = 456
  },

  c01s02_bedroom_opened = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_bedroom_opened.png', 
    width = 198, 
    height = 461
  },

  c01s02_bathroom_closed = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_bathroom_closed.png', 
    width = 129, 
    height = 524
  },

  c01s02_bathroom_opened = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_bathroom_opened.png', 
    width = 164, 
    height = 444
  },

  c01s02_coffeemaker = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_coffeemaker.png', 
    width = 69, 
    height = 90
  },
  
  c01s02_couch = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_couch.png', 
    width = 1016, 
    height = 455
  },

  c01s02_tv = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_tv.png', 
    width = 1140, 
    height = 325
  },

  c01s02_table = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_table.png', 
    width = 977 * 0.9, 
    height = 492 * 0.9
  },

  c01s02_chairs = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_chairs.png', 
    width = 829 * 0.9, 
    height = 474 * 0.9
  },
  
  c01s01_answering_machine = {
    type = RESOURCE_TYPE_TILED_IMAGE, 
    fileName = 'c01s02/c01s02_answer_machine.png', 
    width = 168, height = 108,
    tileMapSize = {2, 1}
  },
  
  c01s02_pantry_closed = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_pantry_closed.png', 
    width = 96, 
    height = 128
  },
  
  c01s02_pantry_opened = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_pantry_opened.png', 
    width = 128, 
    height = 152
  },

  c01s02_coffee = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_coffee.png', 
    width = 30, 
    height = 38
  },
  
  c01s02_coffee_pot_empty = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_coffee_pot_empty.png', 
    width = 59,
    height = 42
  },

  c01s02_coffee_pot_full = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_cofee_pot_full.png', 
    width = 58,
    height = 44
  },
  
  c01s02_mug_full = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_mug_full.png', 
    width = 47,
    height = 40
  },

  c01s02_mug_empty = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_mug_empty.png', 
    width = 47,
    height = 40
  },
  
  c01s02_mug_full_smoke = {
    type = RESOURCE_TYPE_ANIMATION_FRAMES,
    location = 'c01s02/',
    pivotX = 0,
    pivotY = 0,
    animations = {
      mug_full_smoke = {
        fileName = 'c01s02_mug_full_smoke',
        startFrame = 1,
        frameCount = 25,
        frameTime = 0.1,
      },
    },
    width = 80, height = 176
  },
  
  c01s02_sink = {
    type = RESOURCE_TYPE_TILED_IMAGE, 
    fileName = 'c01s02/c01s02_sink.png', 
    width = 320, height = 79,
    tileMapSize = {2, 1}
  },
  
  c01s02_sink_flowing = {
    type = RESOURCE_TYPE_SOUND, 
    fileName = 'c01s02/sink_flowing.wav', 
    loop = true,
    volume = 0.2
  },
  
  c01s02_freezer_closed = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_freezer_closed.png', 
    width = 169, height = 96
  },

  c01s02_freezer_opened = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_freezer_opened.png', 
    width = 162, height = 151
  },

  c01s02_fridge_closed = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_fridge_closed.png', 
    width = 169, height = 260
  },

  c01s02_fridge_opened = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_fridge_opened.png', 
    width = 157, height = 300
  },

  c01s02_cube_tray = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s02/c01s02_cube_tray.png', 
    width = 50, height = 43
  },
    
}




-- function used to dump tables to screen
function dump ( value, key, level )
  -- start from level 0
  if not level then level = 0 end
  
  if type (value) == 'table' then
    for k,v in pairs ( value ) do
      print (tabs(level) .. k)
      dump (v, k, level + 1)
    end
  elseif type (value) == "boolean" then
    if value then print (tabs(level) .. "true") else print (tabs(level) .. "false") end
  elseif type (value) == "userdata" then
    print (tabs(level) .. "[userdata]")
  elseif type (value) == "function" then
    print (tabs(level) .. "[function]")
  elseif value == nil then
    print (tabs(level) .. "nil")
  else
      print (tabs(level) .. value)
  end
end

function tabs (n)
  local counter = n
  local result = ""
  while (counter > 0) do
    result = result .. "\t"
    counter = counter - 1
  end
  return result
end

function debug_line ()
  print ('-------------------------------')
end
function performWithDelay ( delay, func, repeats, ... )
  local t = MOAITimer.new ()
  t:setSpan ( delay/100 )
  t:setMode ( MOAITimer.LOOP )
  t:setListener ( MOAITimer.EVENT_TIMER_LOOP,
  function ()
    t:stop ()
    t = nil
    func ( unpack ( arg ))
    if repeats then
      if repeats > 1 then
        performWithDelay(delay, func, repeats - 1, unpack ( arg ))
      elseif repeats == 0 then
        performWithDelay(delay, func, 0, unpack( arg ))
      end
    end
  end
  )
  t:start ()
end


local collect = collectgarbage
local lastCheck = {sysMem = 0}
function checkMem (say)
   collect()
   local sysMem = collect("count") * .001
   if say == true or lastCheck.sysMem ~= sysMem then
      lastCheck.sysMem = sysMem
      return math.floor(sysMem*1000)*.001
   end
end

table.reverse = function ( aTable )
  local n = #aTable
  local resultTable = {}
  while n > 0 do
    table.insert(resultTable, aTable[n])
    n = n - 1
  end
  return resultTable
end
