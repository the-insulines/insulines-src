--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

print ("Testing src/defines.lua")

require 'defines'

local ts = TestSuite.new()

function WORLD_RESOLUTION_X_is_1440 ()
  return WORLD_RESOLUTION_X == 1440
end
ts:addTestCase(TestCase:new(WORLD_RESOLUTION_X_is_1440, "World resolution x should be 1440", "Is not 1440 :("))

function WORLD_RESOLUTION_Y_is_960 ()
  return WORLD_RESOLUTION_Y == 960
end
ts:addTestCase(TestCase:new(WORLD_RESOLUTION_Y_is_960, "World resolution y should be 960", "Is not 960 :("))

function SCREEN_RESOLUTION_X_is_1024 ()
  return SCREEN_RESOLUTION_X == 1024
end
ts:addTestCase(TestCase:new(SCREEN_RESOLUTION_X_is_1024, "Screen resolution x should be 1024", "Is not 1024 :("))

function SCREEN_RESOLUTION_Y_is_768 ()
  return SCREEN_RESOLUTION_Y == 768
end
ts:addTestCase(TestCase:new(SCREEN_RESOLUTION_Y_is_768, "Screen resolution y should be 768", "Is not 768 :("))


ts:run ( )
