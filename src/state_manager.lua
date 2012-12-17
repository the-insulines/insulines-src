--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "stateManager", package.seeall )

cellphoneClicks = 0

pickedFlyer = false
cellphonePicked = false
fair = false

if DEBUG then
  pickedFlyer = true
  cellphonePicked = true
  fair = true
end