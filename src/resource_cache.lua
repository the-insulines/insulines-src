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
    local width = imageAttributes.width / SCREEN_TO_WORLD_RATIO
    local height = imageAttributes.height / SCREEN_TO_WORLD_RATIO
    image = loadGfxQuad2D ( fileUrl, {-width/2, -height/2, width/2, height/2} )
  end
  
  return image
end

function loadUntzSound ( fileUrl, loop, volume, sound )
  sound.file = MOAIUntzSound.new ()
  sound.file:load ( fileUrl )
  sound.file:setVolume ( volume )
  sound.file:setLooping ( loop )

  function sound:play ()
    self.file:play ()
  end

  function sound:stop ()
    self.file:stop ()
  end
  
  function sound:seekVolume( volume, time, mode)
    self.file:seekVolume(volume, time, mode)
  end
  return sound
end

function loadFmodExSound ( fileUrl, loop, volume, sound )
  sound.file = MOAIFmodExSound.new ()
  sound.file:load ( fileUrl, false, true )
  sound.channel = MOAIFmodExChannel.new ()
  sound.volume = volume
  sound.loop = loop
  sound.channel:setVolume ( volume )
  sound.channel:setLooping ( loop )

  function sound:play ()
    self.channel:setVolume( self.volume )
    local loops = 0
    if self.loop then loops = -1 end
    self.channel:play (self.file, loops)
  end

  function sound:stop ()
    self.channel:stop ()
  end
  
  function sound:seekVolume( volume, time, mode)
    self.channel:seekVolume(volume, time, mode)
  end
  
  return sound
end

function loadSound ( fileUrl, loop, volume )
  local sound = {}
  function sound:play () end
  function sound:stop () end
  
  if SOUND then
    if SOUND_ENGINE == 'untz' then
      sound = loadUntzSound(fileUrl, loop, volume, sound)
    elseif SOUND_ENGINE == 'fmod' then
      sound = loadFmodExSound(fileUrl, loop, volume, sound)
    end
  end
  return sound
end


function loadGfxQuad2D ( fileUrl, imageRect )
  local image = MOAIGfxQuad2D.new ()
  image:setTexture ( fileUrl )
  image:setRect ( unpack (imageRect) )
  
  return image
end


function loadAllAnimationFrames ( allAnimationsLocation, allAnimationsAttributes )
  local animations = {}
  for animationName, animationAttributes in pairs ( allAnimationsAttributes.animations ) do
    if animationAttributes.fileName then
      local animation = loadAnimationFrames ( allAnimationsLocation .. animationName .. '/', animationAttributes, allAnimationsAttributes )
      animations[animationName] = animation
    end
  end

  -- load sounds
  if allAnimationsAttributes.sounds then    
    for animationName, sounds in pairs ( allAnimationsAttributes.sounds ) do
      animations[animationName].sounds = {}
      for i, sound in pairs ( sounds ) do
        animations[animationName].sounds[sound.startFrame] = loadSound(allAnimationsLocation .. animationName .. '/sounds/' .. sound.fileName .. '.mp3', sound.loop, sound.volume )
      end
    end
  end
  return animations
end


function loadAnimationFrames ( animationPath, animationAttributes, defaultAttributes )
  -- load either the animation-specific or default attributes
  local imageAttributes = animationAttributes

  if imageAttributes.width == nil or imageAttributes.height == nil then
    imageAttributes = defaultAttributes
  end
  
  animationFrames = {}
  
  -- load the image corresponding to each frame of the animation
  for frameIndex = 1, animationAttributes.frameCount do
    local frameUrl = animationPath .. animationAttributes.fileName .. '_' .. animationAttributes.startFrame + ( frameIndex - 1 ) .. '.png'
    local frame = loadImage ( frameUrl, imageAttributes )
    table.insert ( animationFrames, frame )
  end
  
  return animationFrames
end


function loadTiledImage ( fileUrl, tiledImageAttributes )
  local tileRectWidth = tiledImageAttributes.width / SCREEN_TO_WORLD_RATIO
  local tileRectHeight = tiledImageAttributes.height / SCREEN_TO_WORLD_RATIO
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


function loadExternal ( key, attributes )
  resources[key] = attributes
  load ( key )
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
    
    elseif (resourceAttributes.type == RESOURCE_TYPE_ANIMATION_FRAMES) then
      resource = loadAllAnimationFrames (ANIMATION_FRAMES_PATH .. resourceAttributes.location, resourceAttributes)
    
    elseif (resourceAttributes.type == RESOURCE_TYPE_FONT) then
      resource = loadFont ( FONTS_PATH .. resourceAttributes.fileName, resourceAttributes.glyphs, resourceAttributes.fontSize, resourceAttributes.dpi )
    
    elseif (resourceAttributes.type == RESOURCE_TYPE_SOUND) then
      resource = loadSound ( SOUNDS_PATH .. resourceAttributes.fileName, resourceAttributes.loop, resourceAttributes.volume )
    end
    
    
    -- store the resource under the key on cache
    cache[key] = resource
    
    if DEBUG then
      print ( "Loaded " .. key, subkey )
    end
  end
end


function unload ( key )
  cache[key] = nil
  
  return true
end


function get ( key, attributes )
  if (not loaded ( key )) then
    if (attributes) then
      loadExternal ( key, attributes )
    else
      load ( key )
    end
  end
  
  return cache[key]
end


function loaded ( key )
  return not (cache[key] == nil)
end
