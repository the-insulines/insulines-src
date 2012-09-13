--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

thankYouScreen = room.new ( "thankYouScreen" )
thankYouScreen.inputEnabled = true
thankYouScreen.characterMovement = false
thankYouScreen.hud = false

objects = {
  background_5 = {
    resource_name = 'thankyou_5',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    renderPriority = 10
  },
  background_4 = {
    resource_name = 'thankyou_4',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    renderPriority = 20
  },
  background_3 = {
    resource_name = 'thankyou_3',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    renderPriority = 30
  },
  background_2 = {
    resource_name = 'thankyou_2',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    renderPriority = 40
  },
  background_1 = {
    resource_name = 'thankyou_1',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    renderPriority = 50
  },
}

thankYouScreen:addObjects ( objects )

function thankYouScreen:beforeInitialize ()
  self:loadObjects ()
end

function thankYouScreen:afterInitialize ()
  performWithDelay(600 * 1, self.objects.background_1.prop.seekColor, 1, self.objects.background_1.prop, 0, 0, 0, 0, 1)
  performWithDelay(600 * 2, self.objects.background_2.prop.seekColor, 1, self.objects.background_2.prop, 0, 0, 0, 0, 1)
  performWithDelay(600 * 3, self.objects.background_3.prop.seekColor, 1, self.objects.background_3.prop, 0, 0, 0, 0, 1)
  performWithDelay(600 * 4, self.objects.background_4.prop.seekColor, 1, self.objects.background_4.prop, 0, 0, 0, 0, 1)
  performWithDelay(600 * 5, self.objects.background_5.prop.seekColor, 1, self.objects.background_5.prop, 0, 0, 0, 0, 2)
  performWithDelay(600 * 5, c01s01.sounds.background.seekVolume, 1, c01s01.sounds.background, 0, 2)
end