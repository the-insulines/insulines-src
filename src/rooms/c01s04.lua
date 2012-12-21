--==============================================================
-- The Insulines - Chapter 01 / Scene 04 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"

c01s04 = function ()
  
  require 'c01s04_definition'
  require 'c01s04_path'
  require 'dialogs/c01s04_dialogs_definition'
  require 'c01s04_interactions'
  require 'c01s04_characters'
  
  
  local c01s04_room = room.new ( "c01s04" )
  
  c01s04_room:addObjects ( c01s04_objects )
  
  c01s04_room.objects['wristband'] = { inventory_resource_name = "inventory_wristband", render_at_start = false }
  
  c01s04_room:loadPath ( c01s04_path )
  c01s04_room:loadObjectInteractions ( c01s04_objectInteractions )
  c01s04_room:loadConversations ( c01s04_conversations )
  
  c01s04_room.frontCharacterZoom = 1.3
  c01s04_room.bottomCharacterZoomThreshold = -542
  
  c01s04_room.backCharacterZoom = 1.0
  c01s04_room.topCharacterZoomThreshold = -100
  
  c01s04_room.initialCameraPathNode = 'start'
  
  c01s04_room.hasExternalAssets = true
  
  
  -- Character initial positions
  -- The pivot was subtracted to calculate the Y coordinate
  c01s04_room.initialCharacterPathNode = 'start'
  c01s04_room.initialMoePosition = point ( -170, -130 - 315 )
  
  
  -- Room specific attributes
  c01s04_room.alleyLightAnimationStep = 1
  c01s04_room.alleyLightOn = false
  c01s04_room.joshWalksIntoAlley = true
  c01s04_room.shadowColor = 0.3
  c01s04_room.shadowTransitionTime = 0.5 -- seconds
  c01s04_room.shadowAnimation = nil
    
  
  -- sounds = {
  -- }
  -- 
  -- c01s04:addSounds( sounds )
  
  
  function c01s04_room:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
    
    -- characters
    self:loadCharacter ( josh () )
    self:loadCharacter ( moe () )
    
    self.objects.moe:setLoc ( self.initialMoePosition.x, self.initialMoePosition.y )
    
    self.objects.moe:startAnimation ( 'stand' )
    
    -- hide objects
    self:stopRendering ( 'c01s04_door_opened' )
  end
  
  
  function c01s04_room:afterInitialize ()
    self:turnAlleyLightOn ()
  end
  
  
  function c01s04_room:walkIntoAlleyAction ()
    if self.shadowAnimation then
      self.shadowAnimation:stop ()
    end
    
    if self.joshWalksIntoAlley then
      self.shadowAnimation = self.objects.josh.prop:seekColor ( self.shadowColor, self.shadowColor, self.shadowColor, 1, self.shadowTransitionTime, MOAIEaseType.LINEAR )
    else
      self.shadowAnimation = self.objects.josh.prop:seekColor ( 1, 1, 1, 1, self.shadowTransitionTime, MOAIEaseType.LINEAR )
    end
    
    self.joshWalksIntoAlley = not self.joshWalksIntoAlley
  end
  
  
  function c01s04_room:walkOutOfAlleyAction ()
    if self.shadowAnimation then
      self.shadowAnimation:stop ()
    end
    
    if self.joshWalksIntoAlley then
      self.shadowAnimation = self.objects.josh.prop:seekColor ( 1, 1, 1, 1, self.shadowTransitionTime, MOAIEaseType.LINEAR )
    else
      self.shadowAnimation = self.objects.josh.prop:seekColor ( self.shadowColor, self.shadowColor, self.shadowColor, 1, self.shadowTransitionTime, MOAIEaseType.LINEAR )
    end
    
    self.joshWalksIntoAlley = not self.joshWalksIntoAlley
  end
  
  
  function c01s04_room:alleyLightAction ()
    if self.alleyLightOn then
      self.alleyLightAnimationStep = 0
      -- MOAICoroutine.blockOnAction ( self:alleyLightAnimation () )
      self:alleyLightAnimation ()
      -- self.objects.josh.currentAction:pause ( false )
    else
      self:turnAlleyLightOn ()
    end
  end
  
  
  function c01s04_room:alleyLightAnimation ()
    self.alleyLightAnimationStep = self.alleyLightAnimationStep + 1
    if self.alleyLightAnimationStep == 1 then
      self:turnAlleyLightOff ()
      performWithDelay ( 5, self.alleyLightAnimation, 1, self )
    elseif self.alleyLightAnimationStep == 2 then
      self:turnAlleyLightOn ()
      performWithDelay ( 15, self.alleyLightAnimation, 1, self )
    elseif self.alleyLightAnimationStep == 3 then
      self:turnAlleyLightOff ()
      performWithDelay ( 5, self.alleyLightAnimation, 1, self )
    elseif self.alleyLightAnimationStep == 4 then
      self:turnAlleyLightOn ()
      performWithDelay ( 8, self.alleyLightAnimation, 1, self )
    elseif self.alleyLightAnimationStep == 5 then
      self:turnAlleyLightOff ()
      performWithDelay ( 5, self.alleyLightAnimation, 1, self )
    elseif self.alleyLightAnimationStep == 6 then
      self:turnAlleyLightOn ()
      performWithDelay ( 4, self.alleyLightAnimation, 1, self )
    elseif self.alleyLightAnimationStep == 7 then
      self:turnAlleyLightOff ()
    end
  end
  
  
  function c01s04_room:turnAlleyLightOn ()
    self.alleyLightOn = true
    
    self:stopRendering ( 'c01s04_sombra_light_off' )
    
    self:startRendering ( 'c01s04_walk_behind_light_on' )
    self:startRendering ( 'c01s04_sombra_light_on' )
    self:startRendering ( 'c01s04_light_on' )
    self:startRendering ( 'c01s04_edificio_costado_light_on' )
  end
  
  
  function c01s04_room:turnAlleyLightOff ()
    self.alleyLightOn = false
    
    self:startRendering ( 'c01s04_sombra_light_off' )
    
    self:stopRendering ( 'c01s04_walk_behind_light_on' )
    self:stopRendering ( 'c01s04_sombra_light_on' )
    self:stopRendering ( 'c01s04_light_on' )
    self:stopRendering ( 'c01s04_edificio_costado_light_on' )
  end
  
  
  return c01s04_room
  
end