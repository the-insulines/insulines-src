--==============================================================
-- Three in a row.
-- Copyright (c) 2010-2012 Francisco Tufró
-- All Rights Reserved. 
-- http://franciscotufro.com.ar // http://quov.is
--==============================================================
module ( "resource_cache", package.seeall )

----------------------------------------------------------------
----------------------------------------------------------------
-- variables
----------------------------------------------------------------
local cache = {}

----------------------------------------------------------------
-- exposed functions
----------------------------------------------------------------
function loadImage ( key, fileName, minU, minV, maxU, maxV )
  image = MOAIGfxQuad2D.new ()
  image:setTexture ( fileName )
  image:setRect ( minU, minV, maxU, maxV )
  
  cache[key] = image
  return cache[key]
end

function unload ( key )
  cache[key] = nil
  return true
end

function get ( key )
  return cache[key]
end

function loaded( key )
  return not (cache[key] == nil)
end