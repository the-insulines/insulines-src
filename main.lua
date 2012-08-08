--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

require 'src/defines'
require 'src/resource_cache'
require 'src/room'
require 'src/characters/main_character'
require 'src/hud/inventory'
require 'src/input_manager'
require 'src/rooms/c01s01'
require 'src/game'

MOAISim.openWindow ( 'The Insulines', SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )

function main ()
  game:start ()
end

gameThread = MOAIThread.new ()
gameThread:run ( main )
