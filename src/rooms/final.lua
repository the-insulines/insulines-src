--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function final ()
  
  require 'final_definition'
  require 'final_interactions'
  
  local s = room.new ( "final" )

  s.shouldShowHud = false
  s.inputEnabled = true
  s.characterMovement = false
  s.hasExternalAssets = true

  local final_sounds = {

    background = {
      resource_name = 'sugar_free'
    }

  }
  
  s:addObjects ( final_objects )
  s:addSounds( final_sounds )
  s:loadObjectInteractions ( final_objectInteractions )
  
  function s:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
  end
  
  function s:afterInitialize ()
    if not game.currentScene.sounds.background:isPlaying () then
      game.currentScene.sounds.background:play ()
    end
  end
  
  return s
end