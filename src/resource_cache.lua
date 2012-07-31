--==============================================================
-- The Insulines.
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved.
-- http://quov.is // http://theinsulines.com
--==============================================================
module ("resource_cache", package.seeall)

require 'defines'


----------------------------------------------------------------
-- resource type constants

IMAGE = 0
TILED_IMAGE = 1


----------------------------------------------------------------
-- resource table

local resourceNameTable = { 
  dummyRoomBackgroundImage = {type = IMAGE, fileName = 'background.jpeg', width = 3146, height = 960},
  guybrushTiledImage = {type = TILED_IMAGE, fileName = 'gb_walk.png', width = 624, height = 450, tileMapSize = {6, 3}},
  cityBackgroundImage0 = {type = IMAGE, fileName = 'b2_l0.png', width = 1920, height = 1200},
  cityBackgroundImage1 = {type = IMAGE, fileName = 'b2_l1.png', width = 1920, height = 1200},
  cityBackgroundImage2 = {type = IMAGE, fileName = 'b2_l2.png', width = 1920, height = 1200},
  cityBackgroundImage3 = {type = IMAGE, fileName = 'b2_l3.png', width = 1920, height = 1200},
  cityBackgroundShadowsImage = {type = IMAGE, fileName = 'b2_shadows.png', width = 1920, height = 1200},
  cityBackgroundLightsImage = {type = IMAGE, fileName = 'b2_lights.png', width = 1920, height = 1200},
}


----------------------------------------------------------------
-- variables

local cache = {}


----------------------------------------------------------------
-- exposed functions

function loadImage (fileUrl, imageAttributes)
  local image
  if (imageAttributes.imageRect) then
    -- load the image specified by it's coordinates
    image = loadGfxQuad2D (fileUrl, imageAttributes.imageRect)
  else
    -- load the entire image specified by it's size
    local width = imageAttributes.width
    local height = imageAttributes.height
    image = loadGfxQuad2D (fileUrl, {-width/2, -height/2, width/2, height/2})
  end
  
  return image
end


function loadGfxQuad2D (fileUrl, imageRect)
  local image = MOAIGfxQuad2D.new ()
  image:setTexture (fileUrl)
  image:setRect (unpack (imageRect))
  
  return image
end


function loadTiledImage (fileUrl, tiledImageAttributes)
  local tileRectWidth = tiledImageAttributes.width / tiledImageAttributes.tileMapSize[1]
  local tileRectHeight = tiledImageAttributes.height / tiledImageAttributes.tileMapSize[2]
  local tileRect = {-tileRectWidth/2, -tileRectHeight/2, tileRectWidth/2, tileRectHeight/2}
  return loadTileDeck2D (fileUrl, tiledImageAttributes.tileMapSize, tileRect)
end


function loadTileDeck2D (fileUrl, tileMapSize, tileRect)
  local tiledImage = MOAITileDeck2D.new ()
  tiledImage:setTexture (fileUrl)
  tiledImage:setSize (unpack (tileMapSize))
  tiledImage:setRect (unpack (tileRect))
  
  return tiledImage
end


function load (key)
    local resourceAttributes = resourceNameTable[key]
    local resource
    
    -- load the resource based on it's type
    if (resourceAttributes.type == IMAGE) then
      resource = loadImage (IMAGES_PATH .. resourceAttributes.fileName, resourceAttributes)
    
    elseif (resourceAttributes.type == TILED_IMAGE) then
      resource = loadTiledImage (TILED_IMAGES_PATH .. resourceAttributes.fileName, resourceAttributes)
    end
    
    -- store the loaded resource on cache
    cache[key] = resource
end


function unload (key)
  cache[key] = nil
  return true
end


function get (key)
  if (not loaded (key)) then
    load (key)
  end
  
  return cache[key]
end


function loaded (key)
  return not (cache[key] == nil)
end
