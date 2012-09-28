--==============================================================
-- The Insulines - Chapter 01 / Scene 03 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"
require 'c01s03_definition'

c01s03 = room.new ( "c01s03" )

c01s03.frontCharacterZoom = 0.9
c01s03.bottomCharacterZoomThreshold = -611

c01s03.backCharacterZoom = 0.3
c01s03.topCharacterZoomThreshold = 323

c01s03.initialCameraPathNode = 'behind_tree'
c01s03.initialCharacterPathNode = 'behind_tree'


c01s03.hasExternalAssets = true

c01s03:addObjects ( objects )

-- sounds = {
-- }
-- 
-- c01s03:addSounds( sounds )

function c01s03:beforeInitialize ()
  self:loadObjects ()
  self:loadSounds ()
  self:loadCharacter( mainCharacter )
  self.objects.main_character:setLoc(0, 0)
end

function c01s03:afterInitialize ()
end

local path = {
  behind_tree = {
    position = point (0, 0),
    neighbors = {},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
}

-- Walk path
c01s03:loadPath(path)
