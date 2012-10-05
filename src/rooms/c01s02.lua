--==============================================================
-- The Insulines - Chapter 01 / Scene 02 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
package.path = package.path .. ";src/rooms/?.lua"


function c01s02 (initialCharacterPathNode, initialCameraPathNode)

  require 'c01s02_definition'
  require 'c01s02_interactions'
  require 'c01s02_characters'
  require 'c01s02_path'
  require 'c01s02_sounds'
  -- require 'dialogs/c01s02_es_dialogs_definition'
  require 'dialogs/c01s02_dialogs_definition'


  local c01s02 = room.new ( "c01s02" )

  c01s02:loadConversations ( c01s02_conversations )
  c01s02:addObjects ( c01s02_objects )
  c01s02:loadObjectInteractions ( c01s02_objectInteractions )
  c01s02:addSounds( c01s02_sounds )
  c01s02:loadPath( c01s02_path )

  -- perspective attributes
  c01s02.frontCharacterZoom = 0.3
  c01s02.bottomCharacterZoomThreshold = -611

  c01s02.backCharacterZoom = 0.1
  c01s02.topCharacterZoomThreshold = 323

  -- initial nodes
  if not initialCameraPathNode then initialCameraPathNode = 'joshDoor' end
  c01s02.initialCameraPathNode = initialCameraPathNode

  if not initialCharacterPathNode then initialCharacterPathNode = 'joshDoor' end
  c01s02.initialCharacterPathNode = initialCharacterPathNode

  c01s02.initialNancyPathNode = 'door'

  -- functions
  function c01s02:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
  
    self:loadCharacter( josh () )
    
    self.objects.josh:setLoc(1120, -245)
    nancy = character.new ( 'nancy' )
    nancy.renderPriority = 100
  end

  function c01s02:afterInitialize ()  
    self.objects.answering_machine.animation:startAnimation ( 'blink' )
    self.objects.coffeeMaker.animation:startAnimation ( 'coffeemaker_empty' )
  
    -- DEBUG MODE
    if DEBUG then
      c01s02.objects.bathroom_closed.visitedBathroom = true;
      c01s02.objects.coffeeMaker.hadCoffee = true;
      c01s02.objects.apartmentDoor.talkedToNancy = true;
      stateManager.cellphonePicked = true
      stateManager.fair = true
      mapHUD:show ()
    end
  
  end

  return c01s02
end

