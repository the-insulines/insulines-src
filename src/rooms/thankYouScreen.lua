--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

thankYouScreen = room.new ( "thankYouScreen" )
thankYouScreen.inputEnabled = true
thankYouScreen.characterMovement = false

thankYouScreen.useInventory = false
thankYouScreen.useHighlights = false
thankYouScreen.fadeOnChange = false

objects = {
  background = {
    resource_name = 'thankYouScreen_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    avoid_clicks = true
  },
}

thankYouScreen:addObjects ( objects )

function thankYouScreen:beforeInitialize ()
  self:loadObjects ()
end

function thankYouScreen:afterInitialize ()
  c01s01.sounds.background:stop ()
  dialog:load ( 'demo' )
end