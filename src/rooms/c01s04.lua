--==============================================================
-- The Insulines - Chapter 01 / Scene 04 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"

c01s04 = function ()

  require 'c01s04_definition'
  require 'c01s04_path'
  require 'dialogs/c01s04_dialogs_definition'
  -- require 'c01s04_interactions'

  local c01s04_room = room.new ( "c01s04" )
  
  
  c01s04_room.frontCharacterZoom = 1.0
  c01s04_room.bottomCharacterZoomThreshold = -542

  c01s04_room.backCharacterZoom = 0.5
  c01s04_room.topCharacterZoomThreshold = 74

  c01s04_room.initialCameraPathNode = 'start'
  
  -- Character initial positions
  -- The pivot was subtracted to calculate the Y coordinate
  c01s04_room.initialCharacterPathNode = 'start'
  c01s04_room.initialMoePosition = point ( -235, -74 - 350 )

  c01s04_room.hasExternalAssets = true
  
  c01s04_room:addObjects ( objects )

  -- Load path and place objects on it
  c01s04_room:loadPath ( path )
  -- c01s04_room:placeObjectsOnPath ( objectPlacementOnPath )
  
  -- c01s04_room:loadObjectInteractions ( objectInteractions )
  
  c01s04_room:loadConversations ( conversations )

  -- sounds = {
  -- }
  -- 
  -- c01s04:addSounds( sounds )

  function c01s04_room:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
    self:loadCharacter ( josh )
    self:loadCharacter ( moe )
    
    self.objects.moe:setLoc ( self.initialMoePosition.x, self.initialMoePosition.y )
    
    self.objects.moe:startAnimation ( 'stand' )
  end

  function c01s04_room:afterInitialize ()
  end
  
  
  return c01s04_room
  
end