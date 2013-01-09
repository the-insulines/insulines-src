--==============================================================
-- The Insulines - Credits screen
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function creditsScreen ()
  local s = room.new ( "creditsScreen" )
  s.shouldShowHud = false
  s.inputEnabled = true
  s.characterMovement = false

  local creditsScreen_objects = {
    background = {
      resource_name = "credits_background",
      layer_name = "background",
      avoid_clicks = true,
      render_at_start = true,
      x = 0,
      y = 0,
    },

    back = {
      resource_name = "credits_back_button",
      layer_name = "objects",
      render_at_start = true,
      x = 595,
      y = 450,
      onClick = function ()
        s.inputEnabled = false
        -- game.currentScene.sounds.background:stop ()
        -- game:switchToScene ( mainScreen )
        game:unloadCurrentScene ()
        game:showScene ( s.backScreen )
        s.backScreen.inputEnabled = true
        s.backScreen = nil
      end
    },
  }
  
  s:addObjects ( creditsScreen_objects )
  
  
  function s:beforeInitialize ()
    self:loadObjects ()
  end
  
  function s:afterInitialize ()
  end
  
  return s
end