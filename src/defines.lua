--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

-- MOAIDebugLines.showStyle ( MOAIDebugLines.PROP_MODEL_BOUNDS )

-- Viewport constants
WORLD_RESOLUTION_X = 1920
WORLD_RESOLUTION_Y = 1280

SCREEN_RESOLUTION_X = 960
SCREEN_RESOLUTION_Y = 640


MAIN_CHARACTER_PIVOT = - 768 / 4
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

-- Debugging
DEBUG = false

-- Animations
JOSH_SLEEPING_SECONDS_PER_FRAME = 0.10
JOSH_WAKES_SECONDS_PER_FRAME = 0.10
JOSH_GRABS_CELLPHONE_SECONDS_PER_FRAME = 0.09
JOSH_GRABS_CELLPHONE_LOOP_SECONDS_PER_FRAME = 0.04

-- Dialog colors
MAIN_CHARACTER_DIALOG_COLOR = { 0.4, 0.8, 1, 1 }
MAIN_CHARACTER_DIALOG_SHADOW_OFFSET = { x = -3, y = -3 }
-- Inventory constants
INVENTORY_OPEN_X = 960 - 200
INVENTORY_OPEN_Y = 0
INVENTORY_CLOSED_X = 960 + 200
INVENTORY_CLOSED_Y = 0
INVENTORY_ANIMATION_LENGTH = 1


-- Language
LANGUAGE = "en"


-- Movement
MOVEMENT_PIXELS_PER_SECOND = 150
MOVEMENT_SECONDS_PER_FRAME = 0.025




-- Resources

-- resource type constants
IMAGES_PATH = '../insulines-gfx/'
--IMAGES_PATH = './'
TILED_IMAGES_PATH = IMAGES_PATH
FONTS_PATH = IMAGES_PATH .. 'fonts/'
SOUNDS_PATH = IMAGES_PATH .. 'sounds/'

RESOURCE_TYPE_IMAGE = 0
RESOURCE_TYPE_TILED_IMAGE = 1
RESOURCE_TYPE_FONT = 2

resources = {
  
  debug_font = {
    type = RESOURCE_TYPE_FONT,
    fileName = 'arialbd.ttf',
    glyphs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?!", 
    fontSize = 26,
    dpi = 160
  },

  hitchcock = {
    type = RESOURCE_TYPE_FONT,
    fileName = 'hitchcock.ttf',
    glyphs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?!", 
    fontSize = 40,
    dpi = 160
  },

  main_character = {
    type = RESOURCE_TYPE_TILED_IMAGE,
    fileName = 'characters/walk_cycle2.png',
    width = 576*5, height = 768*5,
    tileMapSize = {9, 8}
  },

  josh_sleeping = {
    type = RESOURCE_TYPE_TILED_IMAGE,
    fileName = 'characters/josh_sleeping.png',
    width = 8000, height = 4000,
    tileMapSize = {10, 8}
  },

  josh_grabs_cellphone = {
    type = RESOURCE_TYPE_TILED_IMAGE,
    fileName = 'characters/josh_grabs_cellphone.png',
    width = 9200, height = 2520,
    tileMapSize = {10, 6}
  },

  josh_wakes_up = {
    type = RESOURCE_TYPE_TILED_IMAGE,
    fileName = 'characters/josh_wakes_up.png',
    width = 7000, height = 1800,
    tileMapSize = {10, 3}
  },
  
  inventory_background = {
    type = RESOURCE_TYPE_TILED_IMAGE, 
    fileName = 'inventory_background.png', 
    width = 400, height = 1080, 
    tileMapSize = {1, 1}
  },
  
  inventory_backpack = {
    type = RESOURCE_TYPE_TILED_IMAGE,
    fileName = 'backpack.png',
    width = 256, height = 128,
    tileMapSize = {2, 1}
  },
  
  c01s01_background = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/c01s01_background_B.png', 
    width = 1920, 
    height = 1080
  },
  
  c01s01_lights_off_highlights_B = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/c01s01_lights_off_highlights_B.png', 
    width = 1920, 
    height = 1080
  },
  
  c01s01_lights_off_shadows_B = {
    type = RESOURCE_TYPE_IMAGE, 
    fileName = 'c01s01/c01s01_lights_off_shadows_B.png', 
    width = 1920, 
    height = 1080
  },
  
  c01s01_cellphone = {
    type = RESOURCE_TYPE_TILED_IMAGE, 
    fileName = 'c01s01/cellphone/cellphone_ring.png', 
    width = 1100, height = 100,
    tileMapSize = {11, 1}
  },

  c01s01_cellphone_ringtone = {
    type = RESOURCE_TYPE_SOUND, 
    fileName = 'c01s01/cellphone/ringtone_loop_long.wav', 
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
    width = 477,
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