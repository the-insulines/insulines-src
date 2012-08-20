--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

require 'src/math/point2d'
require 'src/path'
require 'src/resource_cache'
require 'src/defines'
require 'src/room'
require 'src/animatedProp'
require 'src/game'

require 'src/characters/main_character'

require 'src/hud/inventory'
require 'src/hud/dialog'
require 'src/dialogTree'

require 'src/input_manager'

require 'src/rooms/c01s01'


if DEBUG then
  require 'src/hud/debugHUD'
end

MOAISim.openWindow ( 'The Insulines', SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )

function main ()
  
  game:start ()
end


gameThread = MOAIThread.new ()
gameThread:run ( main )
