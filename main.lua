--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
DEFAULT_ASSETS_PATH = '../insulines-gfx/'
SOUND_ENGINE = 'untz'

require 'src/requires'

MOAISim.openWindow ( 'The Insulines', SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )

function main ()
  game:start ()
end

gameThread = MOAIThread.new ()
gameThread:run ( main )
