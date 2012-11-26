--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function logoScreen ()
  local s = room.new ( "logoScreen" )
  s.shouldShowHud = false
  s.inputEnabled = true
  s.characterMovement = false

  objects = {
    background = {
      resource_name = 'logoScreen_background',
      layer_name = 'background',
      x = 0,
      y = 0,
      render_at_start = true,
      onClick = function ()
        s.inputEnabled = false
        game:switchToScene ( c01s01 )
      end
    },
  }

  s:addObjects ( objects )

  function s:beforeInitialize ()
    self:loadObjects ()
  end

  function s:afterInitialize ()
  end

  return s
end