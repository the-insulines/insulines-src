--==============================================================
-- The Insulines - Chapter 01 / Scene 04 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"

map = function ()
  
  require 'map_definition'
  require 'map_interactions'
  
  local map_room = room.new ( "map" )

  map_room:addObjects ( map_objects )
  map_room:loadObjectInteractions ( map_objectInteractions )

  map_room.hasExternalAssets = true
  map_room.inputEnabled = true
  map_room.characterMovement = false
  map_room.useInventory = false
  map_room.useDialogs = false
  map_room.useMap = false
  map_room.useCellphone = false
  

  function map_room:beforeInitialize ()
    self:loadObjects ()
    dump ( stateManager.map )
  end
  
  
  function map_room:afterInitialize ()
  end
  
  return map_room
  
end