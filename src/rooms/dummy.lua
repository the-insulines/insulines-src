--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

dummy_room = room.new ()

dummy_room.initialize = function ()
  dummy_room:setupBackground("Dummy", "../insulines-gfx/background.jpeg", 3146, 960)
  game.camera:setLoc(600,0)
end

