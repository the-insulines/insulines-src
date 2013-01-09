--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function c01s01(initialCharacterPathNode, initialCameraPathNode)
  require 'c01s01_definition'
  require 'c01s01_interactions'
  require 'c01s01_path'
  require 'c01s01_sounds'

  -- require 'dialogs/c01s01_es_dialogs_definition'
  require 'dialogs/c01s01_dialogs_definition'

  local c01s01 = room.new ( "c01s01" )
  
  c01s01:loadConversations ( c01s01_conversations )
  c01s01:addObjects ( c01s01_objects )
  c01s01:loadObjectInteractions ( c01s01_objectInteractions )
  c01s01:addSounds( c01s01_sounds )
  c01s01:loadPath(c01s01_path)


  -- perspective attributes
  c01s01.frontCharacterZoom = 1
  c01s01.bottomCharacterZoomThreshold = -430
  c01s01.backCharacterZoom = 0.9
  c01s01.topCharacterZoomThreshold = -47


  -- initial nodes
  if not initialCameraPathNode then initialCameraPathNode = 'bed' end
  c01s01.initialCameraPathNode = initialCameraPathNode

  if not initialCharacterPathNode then initialCharacterPathNode = 'movePoint' end
  c01s01.initialCharacterPathNode = initialCharacterPathNode

  c01s01.characterMovement = false


  -- functions
  function c01s01:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
    self:loadCharacter( josh () )
    self:stopRendering( 'josh' )
    self.characterMovement = false
  end

  function c01s01:afterInitialize ()
    if stateManager.state.c01s01.dressed then
      -- wake up
      self:stopRendering ( 'cellphone' )
      self:stopRendering ( "josh_sleeping" )
      self.objects.josh_sleeping.animation:stopCurrentAnimation ()
      self.objects.window.highlight = true
      self.objects.barbarullo.highlight = true
      self.objects.floyd.highlight = true
      self.objects.walk_behind.highlight = true
      
      -- dress
      self:stopRendering ( "clothes_heap" )
      self:startRendering ( "clothes_on_heap" )
      self:startRendering ( "josh" )
      self:resetCharacter ()
      self.objects.josh:startAnimation ( 'stand_front' )
      self.sounds.background:play ()
      self.objects.clothes_on_heap.highlight = true
    else
      self:stopRendering( 'josh' )
      self.characterMovement = false

      if not stateManager.state.c01s01.woke then
        self.objects.cellphone:calling ()
        self.objects.josh_sleeping.animation:startAnimation ( 'sleeps' )
      else
        self.objects.window.highlight = true
        self.objects.barbarullo.highlight = true
        self.objects.floyd.highlight = true
        self.objects.walk_behind.highlight = true
      
        self:stopRendering ( "josh_sleeping" )
        self.objects.josh_sleeping.animation:stopCurrentAnimation ()
        self.objects.cellphone:wakeUp ()
      end
    end
  end


  return c01s01
end