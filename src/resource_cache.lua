--==============================================================
-- The Insulines.
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved.
-- http://quov.is // http://theinsulines.com
--==============================================================
module ("resource_cache", package.seeall)

----------------------------------------------------------------
-- variables

local cache = {}


----------------------------------------------------------------
-- exposed functions
function loadFont ( fileUrl, glyphs, fontSize, dpi )
  local font = MOAIFont.new ()
  font:loadFromTTF (fileUrl, glyphs, fontSize, dpi )
  return font
end
  
function loadImage ( fileUrl, imageAttributes )
  local image
  if imageAttributes.imageRect then
    -- load the image specified by it's coordinates
    image = loadGfxQuad2D ( fileUrl, imageAttributes.imageRect )
  else
    -- load the entire image specified by it's size
    local width = imageAttributes.width
    local height = imageAttributes.height
    image = loadGfxQuad2D ( fileUrl, {-width/2, -height/2, width/2, height/2} )
  end
  
  return image
end

function loadSound ( fileUrl, loop, volume )
  local sound = MOAIUntzSound.new ()
  sound:load ( fileUrl )
  sound:setVolume ( volume )
  sound:setLooping ( loop )
  return sound
end


function loadGfxQuad2D ( fileUrl, imageRect )
  local image = MOAIGfxQuad2D.new ()
  image:setTexture ( fileUrl )
  image:setRect ( unpack (imageRect) )
  
  return image
end


function loadTiledImage ( fileUrl, tiledImageAttributes )
  local tileRectWidth = tiledImageAttributes.width / tiledImageAttributes.tileMapSize[1]
  local tileRectHeight = tiledImageAttributes.height / tiledImageAttributes.tileMapSize[2]
  local tileRect = {-tileRectWidth/2, -tileRectHeight/2, tileRectWidth/2, tileRectHeight/2}
  return loadTileDeck2D ( fileUrl, tiledImageAttributes.tileMapSize, tileRect )
end


function loadTileDeck2D ( fileUrl, tileMapSize, tileRect )
  local tiledImage = MOAITileDeck2D.new ()
  tiledImage:setTexture ( fileUrl )
  tiledImage:setSize ( unpack (tileMapSize) )
  tiledImage:setRect ( unpack (tileRect) )
  return tiledImage
end


function load ( key )
  local resourceAttributes = resources[key]
  
  if not resourceAttributes then
    print ( "Can't load " .. key)
  else
    local resource
    
    -- load the resource based on it's type
    if (resourceAttributes.type == RESOURCE_TYPE_IMAGE) then
      resource = loadImage (IMAGES_PATH .. resourceAttributes.fileName, resourceAttributes)
  
    elseif (resourceAttributes.type == RESOURCE_TYPE_TILED_IMAGE) then
      resource = loadTiledImage (TILED_IMAGES_PATH .. resourceAttributes.fileName, resourceAttributes)
      
    elseif (resourceAttributes.type == RESOURCE_TYPE_FONT) then
      resource = loadFont ( FONTS_PATH .. resourceAttributes.fileName, resourceAttributes.glyphs, resourceAttributes.fontSize, resourceAttributes.dpi )

    elseif (resourceAttributes.type == RESOURCE_TYPE_SOUND) then
      resource = loadSound ( SOUNDS_PATH .. resourceAttributes.fileName, resourceAttributes.loop, resourceAttributes.volume )
    end
  
    -- store the loaded resource on cache
    cache[key] = resource
    
    if DEBUG then
      print ( "Loaded " .. key )
    end
  end
end


function unload ( key )
  cache[key] = nil
  return true
end


function get ( key )
  if (not loaded ( key )) then
    load ( key )
  end
  
  return cache[key]
end


function loaded ( key )
  return not (cache[key] == nil)
end
