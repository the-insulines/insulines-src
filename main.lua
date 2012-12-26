--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
DEFAULT_ASSETS_PATH = '../insulines-gfx/'
-- DEFAULT_ASSETS_PATH = '../insulines-hosts/scripts/assets/'
--SOUND_ENGINE = 'fmod'
SOUND_ENGINE = 'untz'

-- LANGUAGE = 'es'
SCREEN_RESOLUTION_X = 960
SCREEN_RESOLUTION_Y = 640
SCREEN_TO_WORLD_RATIO = 1

-- SCREEN_RESOLUTION_X = 1920
-- SCREEN_RESOLUTION_Y = 1280
-- SCREEN_TO_WORLD_RATIO = 1

require 'src/requires'

MOAISim.openWindow ( 'The Insulines', SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )

function main ()
  game:start ()
end

gameThread = MOAIThread.new ()
gameThread:run ( main )
