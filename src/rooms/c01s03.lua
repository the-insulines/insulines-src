--==============================================================
-- The Insulines - Chapter 01 / Scene 03 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"

c01s03 = function()

  require 'c01s03_definition'
  require 'c01s03_path'
  require 'dialogs/c01s03_dialogs_definition'
  require 'c01s03_interactions'

  local c01s03_room = room.new ( "c01s03" )

  c01s03_room.frontCharacterZoom = 1.3
  c01s03_room.bottomCharacterZoomThreshold = -542

  c01s03_room.backCharacterZoom = 0.5
  c01s03_room.topCharacterZoomThreshold = 74

  c01s03_room.initialCameraPathNode = 'start'
  c01s03_room.initialCharacterPathNode = 'start'

  c01s03_room.hasExternalAssets = true

  c01s03_room:addObjects ( objects )

  -- sounds = {
  -- }
  -- 
  -- c01s03:addSounds( sounds )

  function c01s03_room:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
    self:loadCharacter( josh )
  end

  function c01s03_room:afterInitialize ()
  end
  
  -- Load path and place objects on it
  c01s03_room:loadPath ( path )
  c01s03_room:placeObjectsOnPath ( objectPlacementOnPath )
  
  c01s03_room:loadObjectInteractions ( objectInteractions )
  
  return c01s03_room
  
end
