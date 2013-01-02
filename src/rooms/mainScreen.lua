--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function mainScreen ()
  local s = room.new ( "mainScreen" )
  s.shouldShowHud = false
  s.inputEnabled = true
  s.characterMovement = false

  local mainScreen_objects = {
    background = {
      resource_name = "main_screen",
      layer_name = "background",
      animated = true,
      avoid_clicks = true,
      render_at_start = true,
      x = 0,
      y = 0,
    },

    play = {
      resource_name = "main_screen_play",
      layer_name = "objects",
      render_at_start = true,
      x = 595,
      y = 450,
      onClick = function ()
        -- when a new game is started, create the new state of the game
        if stateManager.state == nil then
          stateManager:newState ()
        end
        
        s.inputEnabled = false
        game.currentScene.sounds.background:stop ()
        game:switchToScene ( c01s01 )
      end
    },
    
    continue = {
      resource_name = "main_screen_continue",
      layer_name = "objects",
      render_at_start = stateManager:savedStateExists (),
      x = 500,
      y = 200,
      onClick = function ()
        stateManager:loadState ()
        s.inputEnabled = false
        game.currentScene.sounds.background:stop ()
        game:switchToScene ( game:sceneNamed ( stateManager.state.currentScene ) )
      end,
    },
    
    credits = {
      resource_name = "main_screen_credits",
      layer_name = "objects",
      render_at_start = true,
      x = -500,
      y = -500,
    },
    
    
    
  }
  
  local mainScreen_sounds = {

    background = {
      resource_name = 'sugar_free'
    }

  }
  
  s:addObjects ( mainScreen_objects )
  s:addSounds( mainScreen_sounds )

  function s:beforeInitialize ()
    self:loadObjects ()
    self:loadSounds ()
  end

  function s:afterInitialize ()
    game.currentScene.sounds.background:play ()
    self.objects.background.animation:startAnimation('intro')
  end

  return s
end