--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function logoScreen ()
  local s = room.new ( "logoScreen" )
  s.hud = false
  s.inputEnabled = true
  s.characterMovement = false

  objects = {
    background = {
      resource_name = 'logoScreen_background',
      layer_name = 'background',
      x = 0,
      y = 0,
      render_at_start = true,
      avoid_clicks = true,
    },
    
    newGameButton = {
      resource_name = 'mainScreenNewGameButton',
      layer_name = 'objects',
      x = -700,
      y = 400,
      render_at_start = true,
      onClick = function ()
        if stateManager.state == nil then
          stateManager:newState ()
        end
        s:unload ()
        s.inputEnabled = false
        game:loadScene(c01s01)
      end,
    },
    
    continueButton = {
      resource_name = 'mainScreenContinueButton',
      layer_name = 'objects',
      x = 700,
      y = 400,
      render_at_start = false,
      onClick = function ()
        stateManager:loadState ()
        s:unload ()
        s.inputEnabled = false
        game:loadSceneNamed(stateManager.state.currentScene)
      end,
    },
    
  }

  s:addObjects ( objects )

  function s:beforeInitialize ()
    self:loadObjects ()
    
    if stateManager:savedStateExists () then
      self:startRendering( 'continueButton' )
    end
  end

  function s:afterInitialize ()
  end

  return s
end