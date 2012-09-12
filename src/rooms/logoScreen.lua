--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

logoScreen = room.new ( "logoScreen" )
logoScreen.hud = false
logoScreen.inputEnabled = true
logoScreen.characterMovement = false

objects = {
  background = {
    resource_name = 'logoScreen_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    onClick = function ()
      logoScreen:unload ()
      logoScreen.inputEnabled = false
      performWithDelay ( 100, game.loadScene, 1, game, c01s01 )
    end
  },
  
  
}

logoScreen:addObjects ( objects )

function logoScreen:beforeInitialize ()
  self:loadObjects ()
end

function logoScreen:afterInitialize ()
end