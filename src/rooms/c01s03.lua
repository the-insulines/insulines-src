--==============================================================
-- The Insulines - Chapter 01 / Scene 03 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"

c01s03 = function ()

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
  
  -- Character initial positions
  -- The pivot was subtracted to calculate the Y coordinate
  c01s03_room.initialCharacterPathNode = 'start'
  c01s03_room.initialHowardPosition = point ( 330, 90 - 200 )
  c01s03_room.initialKleinPosition = point ( 800, 0 - 300 )
  c01s03_room.initialSonjaPosition = point ( -800, -200 - 400 )
  c01s03_room.initialPaulPosition = point ( 120, 110 - 200 )
  c01s03_room.initialPetePosition = point ( -20, 100 - 180 )

  c01s03_room.hasExternalAssets = true
  
  c01s03_room:addObjects ( objects )

  -- Load path and place objects on it
  c01s03_room:loadPath ( path )
  c01s03_room:placeObjectsOnPath ( objectPlacementOnPath )
  
  c01s03_room:loadObjectInteractions ( objectInteractions )
  
  c01s03_room:loadConversations ( conversations )

  -- sounds = {
  -- }
  -- 
  -- c01s03:addSounds( sounds )

  function c01s03_room:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
    self:loadCharacter ( josh )
    self:loadCharacter ( howard )
    self:loadCharacter ( klein )
    self:loadCharacter ( sonja )
    self:loadCharacter ( paul )
    self:loadCharacter ( pete )
    
    self.objects.howard:setLoc ( self.initialHowardPosition.x, self.initialHowardPosition.y )
    self.objects.klein:setLoc ( self.initialKleinPosition.x, self.initialKleinPosition.y )
    self.objects.sonja:setLoc ( self.initialSonjaPosition.x, self.initialSonjaPosition.y )
    self.objects.paul:setLoc ( self.initialPaulPosition.x, self.initialPaulPosition.y )
    self.objects.pete:setLoc ( self.initialPetePosition.x, self.initialPetePosition.y )
    
    self.objects.howard:startAnimation ( 'stand' )
    self.objects.klein:startAnimation ( 'stand' )
    self.objects.sonja:startAnimation ( 'stand' )
    self.objects.paul:startAnimation ( 'stand' )
    self.objects.pete:startAnimation ( 'stand' )
  end

  function c01s03_room:afterInitialize ()
  end
  
  
  return c01s03_room
  
end
