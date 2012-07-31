--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "room", package.seeall )

function new (name)
  local room = {}
  
  room.layers = {}
  
  room.name = name
  
  room.setupBackground = function ( self, name, filename, width, height )
    -- Create background prop
    local bkg_gfx = resource_cache.loadImage( name .. "Background", filename, -width/2, -height/2, width/2, height/2)
    local bkg_prop = MOAIProp2D.new ()
    bkg_prop:setDeck ( bkg_gfx )
    bkg_prop:setLoc ( 0, 0 )
    
    -- Setup layer
    bkg_layer = MOAILayer2D.new ()
    bkg_layer:insertProp ( bkg_prop )
    self.layers[1] = bkg_layer
    
  end
  
  return room
end