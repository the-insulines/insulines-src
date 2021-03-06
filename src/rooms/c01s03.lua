--==============================================================
-- The Insulines - Chapter 01 / Scene 03 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"
require 'c01s03_definition'

c01s03 = room.new ( "c01s03" )

c01s03.frontCharacterZoom = 1.3
c01s03.bottomCharacterZoomThreshold = -542

c01s03.backCharacterZoom = 0.5
c01s03.topCharacterZoomThreshold = 74

c01s03.initialCameraPathNode = 'start'
c01s03.initialCharacterPathNode = 'start'


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
end

function c01s03:afterInitialize ()
end

local path = {
  start = {
    position = point (-470, 32),
    neighbors = {'pete_and_paul'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  pete_and_paul = {
    position = point (-146, -216),
    neighbors = {'start', 'foam', 'stuff'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  foam = {
    position = point (90, -314),
    neighbors = {'pete_and_paul', 'bottle_emporium','stuff'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  bottle_emporium = {
    position = point (476, -540),
    neighbors = {'foam', 'stuff'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  stuff = {
    position = point (-182, -392),
    neighbors = {'bottle_emporium','foam', 'pete_and_paul'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
}

-- Walk path
c01s03:loadPath(path)
