--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function c01s01()
  require 'c01s01_definition'
  require 'c01s01_interactions'
  require 'c01s01_path'

  if LANGUAGE=="es" then
    require 'dialogs/c01s01_es_dialogs_definition'
  else  
    require 'dialogs/c01s01_dialogs_definition'
  end


  local c01s01 = room.new ( "c01s01" )

  -- perspective attributes
  c01s01.frontCharacterZoom = 0.9
  c01s01.bottomCharacterZoomThreshold = -500
  c01s01.backCharacterZoom = 0.85
  c01s01.topCharacterZoomThreshold = -66

  c01s01.initialCameraPathNode = 'bed'
  c01s01.initialCharacterPathNode = 'movePoint'

  c01s01:loadConversations ( conversations )

  c01s01.characterMovement = false

  c01s01:addObjects ( objects )
  c01s01:loadObjectInteractions ( objectInteractions )
  sounds = {
    
    ambient = {
      resource_name = 'c01s01_ambient'
    },
    
    cellphone = {
      resource_name = 'c01s01_cellphone_ringtone'
    },
    
    background = {
      resource_name = 'c01s01_theme'
    }
    
  }

  c01s01:addSounds( sounds )

  function c01s01:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
    josh = character.new ( 'josh' )
    josh.renderPriority = 200
    self:loadCharacter( josh )
    self:stopRendering( 'josh' )
    self.characterMovement = false
  end

  function c01s01:afterInitialize ()
    self.objects.cellphone:calling ()
    self.objects.josh_sleeping.animation:startAnimation ( 'sleeps' )
    self:stopRendering( 'josh' )
    self.characterMovement = false
  end


  -- Walk path
  c01s01:loadPath(path)
  return c01s01
end