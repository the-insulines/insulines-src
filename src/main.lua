--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

require 'math/point2d'
require 'path'
require 'resource_cache'
require 'defines'
require 'room'
require 'animatedProp'
require 'game'

require 'character'
require 'characters'

require 'hud/inventory'
require 'hud/highlight'
require 'hud/dialog'
require 'hud/hud'

require 'dialogTree'

require 'input_manager'

require 'rooms/c01s01'
require 'rooms/c01s02'

if DEBUG then
  require 'hud/debugHUD'
end

MOAISim.openWindow ( 'The Insulines', SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )

function main ()
  game:start ()
end


gameThread = MOAIThread.new ()
gameThread:run ( main )
