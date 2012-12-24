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
  require 'c01s03_characters'
  
  local c01s03_room = room.new ( "c01s03" )

  c01s03_room:addObjects ( c01s03_objects )
  c01s03_room:loadPath ( c01s03_path )
  c01s03_room:placeObjectsOnPath ( c01s03_objectPlacementOnPath )
  c01s03_room:loadObjectInteractions ( c01s03_objectInteractions )
  c01s03_room:loadConversations ( c01s03_conversations )

  c01s03_room.frontCharacterZoom = 1.3
  c01s03_room.bottomCharacterZoomThreshold = -400
  c01s03_room.backCharacterZoom = 0.5
  c01s03_room.topCharacterZoomThreshold = 40

  c01s03_room.initialCameraPathNode = 'start'
  
  -- Character initial positions
  -- The pivot was subtracted to calculate the Y coordinate
  c01s03_room.initialCharacterPathNode = 'start'
  c01s03_room.initialPositions = {
    howard = point ( 330, 90 - 200 ),
    klein = point ( 800, 0 - 300 ),
    klein_eyes = point ( 765, 165 ),
    klein_mouth = point ( 756, 104 ),
    paul = point ( 120, 110 - 200 ),
    paul_eyes = point ( 106, 232 ),
    paul_mouth = point ( 108, 192 ),
    pete = point ( -20, 100 - 180 ),
    pete_eyes = point ( 0, 155 ),
    pete_mouth = point ( -10, 140 ),
    sonja = point ( -800, -200 - 400 ),
    sonja_eyes = point ( -797, -62 ),
    sonja_mouth = point ( -800, -102 ),
  }
  
  c01s03_room.hasExternalAssets = true
  
  
  -- Room specific attributes
  c01s03_room.lampLightOn = 5
  c01s03_room.nextLampLight = -1
  
  
  -- Scene objects
  c01s03_externalObjects = {
    c01s03_candle_light1 = {
      externalAsset = true,
      resource_name = "c01s03_candle_light",
      layer_name = "objects",
      x = 408,
      y = 26,
      render_at_start = true,
      animated = true,
      renderPriority = 100,
    },
    
    c01s03_candle_light2 = {
      externalAsset = true,
      resource_name = "c01s03_candle_light",
      layer_name = "objects",
      x = 90,
      y = -18,
      render_at_start = true,
      animated = true,
      renderPriority = 100,
    },
    
    c01s03_candle_light3 = {
      externalAsset = true,
      resource_name = "c01s03_candle_light",
      layer_name = "objects",
      x = 106,
      y = -38,
      render_at_start = true,
      animated = true,
      renderPriority = 100,
    },
  }
  
  c01s03_room:addObjects ( c01s03_externalObjects )
  
  
  function c01s03_room:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()

    self:loadCharacter ( josh () )

    for characterName, character in pairs(c01s03_characters) do
      self:loadCharacter ( character () )
      self.objects[characterName]:setLoc(self.initialPositions[characterName].x, self.initialPositions[characterName].y)
      self.objects[characterName]:startAnimation ( 'stand' )
    end
    
    self.objects.c01s03_candle_light1.animation:startAnimation ( 'c01s03_candlelight' )
    self.objects.c01s03_candle_light2.animation:startAnimation ( 'c01s03_candlelight' )
    self.objects.c01s03_candle_light3.animation:startAnimation ( 'c01s03_candlelight' )
  end
  
  
  function c01s03_room:afterInitialize ()
    performWithDelay ( 50, self.lampsLightAnimation, 0, self )
  end
  
  
  -- face animations
  function c01s03_room:moveEyesTo ( char, eyesPosition )
    eyes = self.objects[char.name .. '_eyes']
    if eyes then
      eyes:setLoc ( eyesPosition.x, eyesPosition.y )
    end
  end
  
  function c01s03_room:moveMouthTo ( char, mouthPosition )
    mouth = self.objects[char.name .. '_mouth']
    if mouth then
      mouth:setLoc ( mouthPosition.x, mouthPosition.y )
    end
  end
  
  
  function c01s03_room:lampsLightAnimation ()
    self:stopRendering ( 'c01s03_lamp_piso_light' .. self.lampLightOn )
    
    self.lampLightOn = self.lampLightOn + self.nextLampLight
    
    self:startRendering ( 'c01s03_lamp_piso_light' .. self.lampLightOn )
    
    if self.lampLightOn == 1 then
      self.nextLampLight = 1
    elseif self.lampLightOn == 5 then
      self.nextLampLight = -1
    end
  end
  
  function c01s03_room:cellphoneMessage ()
    cellphoneHUD:messageArrived(self.moesMessage, self)
  end
  
  function c01s03_room:moesMessage ()
    print ("Load message...")
    stateManager.venue = true
  end
  
  return c01s03_room
  
end
