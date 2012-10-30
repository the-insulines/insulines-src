--==============================================================
-- The Insulines - Chapter 01 / Scene 04 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"

stateManager.map = {}
stateManager.map = { venue = false }

map = function ()
  
  require 'map_definition'
  require 'map_interactions'
  
  local map_room = room.new ( "map" )
  
  map_room.hasExternalAssets = true
  map_room.inputEnabled = true
  map_room.characterMovement = false
  map_room.hud = false

  map_room:addObjects ( objects )
  
  map_room:loadObjectInteractions ( objectInteractions )
  
  function map_room:beforeInitialize ()
    self:loadObjects ()
  end
  
  
  function map_room:afterInitialize ()

    if stateManager.venue then
      self:startRendering('venue')
    else
      self:stopRendering('venue')
    end

  end
  
  return map_room
  
end