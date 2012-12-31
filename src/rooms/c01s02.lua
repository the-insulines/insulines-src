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
  c01s02.frontCharacterZoom = 0.9
  c01s02.bottomCharacterZoomThreshold = -442

  c01s02.backCharacterZoom = 0.7
  c01s02.topCharacterZoomThreshold = -71

  -- initial nodes
  if not initialCameraPathNode then initialCameraPathNode = 'joshDoor' end
  c01s02.initialCameraPathNode = initialCameraPathNode

  if not initialCharacterPathNode then initialCharacterPathNode = 'joshDoor' end
  c01s02.initialCharacterPathNode = initialCharacterPathNode

  c01s02.initialNancyPathNode = 'door'
  c01s02.finalNancyPathNode = 'bobbyDoor'

  -- functions
  function c01s02:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
  
    self:loadCharacter( josh () )
    
    self.objects.josh:setLoc(1120, -245)
  end

  function c01s02:afterInitialize ()
    -- Setup scene using state manager
    if stateManager.state.c01s02.hasCoffee and not stateManager.state.c01s02.madeCoffee then
      game.currentScene.objects.coffeeMaker.animation:startAnimation ( 'coffeemaker_loaded' )
    end
    
    if stateManager.state.c01s02.hasWater and not stateManager.state.c01s02.madeCoffee then
      game.currentScene.objects.coffeePotEmpty.prop:setLoc ( game.currentScene.objects.coffeeMaker.x - 7, game.currentScene.objects.coffeeMaker.y - 78 )
      game.currentScene.objects.coffeePotEmpty.onClick = nil
      game.currentScene:startRendering ( 'coffeePotEmpty' )
    end
    
    if (stateManager.state.c01s02.hasWater and stateManager.state.c01s02.hasCoffee and not stateManager.state.c01s02.madeCoffee) or stateManager.state.c01s02.madeCoffee then
      game.currentScene.objects.coffeeMaker:prepareCoffee()
    end
    
    if stateManager.state.c01s02.hadCoffee then
      game.currentScene.objects.coffeeMaker:prepareCoffee()
    end
    
    if stateManager.state.c01s02.pickedFlyer then
      game.currentScene:stopRendering ( 'flyer' )
    end
    
    -- load Nancy
    if stateManager.state.c01s02.talkedToNancy then
      if not game.currentScene.objects.nancy then
        game.currentScene:loadCharacter ( nancy () )
      end
      
      local pos = game.currentScene.path.graph[game.currentScene.finalNancyPathNode].position
      game.currentScene.objects.nancy.prop:setLoc(pos.x, pos.y)
      game.currentScene.objects.nancy:moveTo(pos.x, pos.y, game.currentScene.perspectiveZoomFactor, 0.00001)
      game.currentScene:startRendering ( 'nancy' )
      game.currentScene.objects.nancy:standLookingInDirection ( DIRECTION_LEFT )
      -- game.currentScene:moveCharacterToNode('nancy', game.currentScene.finalNancyPathNode, game.currentScene.objects.apartmentDoor.closeDoor, game.currentScene)
    end
    
    
    -- self.objects.answering_machine.animation:startAnimation ( 'blink' )
    -- self.objects.coffeeMaker.animation:startAnimation ( 'coffeemaker_empty' )
    
  end

  return c01s02
end

