--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

c01s01 = room.new ( "Bedroom" )

c01s01.initialCameraX = 0
c01s01.initialCameraY = 0
c01s01.initialCameraScl = 0.8

objects = {
  background = {
    resource_name = 'c01s01_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    avoid_clicks = true
  },
  
  lights_off_shadows = {
    resource_name = 'c01s01_lights_off_shadows_B',
    layer_name = 'walk_behind_shadows',
    x = 0,
    y = 0,
    render_at_start = false,
    avoid_clicks = true
  },
  
  lights_off_highlights = {
    resource_name = 'c01s01_lights_off_highlights_B',
    layer_name = 'background_highlights',
    x = 0,
    y = 0,
    render_at_start = false,
    avoid_clicks = true
  },
  
  cellphone = {
    resource_name = "c01s01_cellphone",
    layer_name = "objects",
    animated = true,
    animations = {
      {'stand_by', 1, 2, 1},
      --{'calling', 3, 2, 1},
    },
    x = -30,
    y = 110,
    render_at_start = true,
    clicks = 0,
    woke = false,
    onClick = function ()
      if not c01s01.objects.cellphone.woke then
        if c01s01.objects.cellphone.clicks == 2 then
          MOAILogMgr.log ( "Wakes up" )
          c01s01.objects.cellphone.woke = true
          inventory:addObject ( "cellphone", c01s01.objects.cellphone )
          c01s01:stopRendering ( "cellphone" )
        else
          MOAILogMgr.log ( "Moves in the bed..." )
          c01s01.objects.cellphone.clicks = c01s01.objects.cellphone.clicks + 1
        end
      end
    end
  },

  clothes_heap = {
    resource_name = "c01s01_clothes_heap",
    layer_name = "walk_behind",
    x = 0,
    y = -300,
    render_at_start = true,
    dressed = false,
    onClick = function ()
      if c01s01.objects.cellphone.woke then
        if not c01s01.objects.clothes_heap.dressed then
          print ( "Dressing..." )
          c01s01.objects.clothes_heap.dressed = true
          c01s01:stopRendering ( "clothes_heap" )
          c01s01:startRendering ( "clothes_on_heap" )
        end
      end
    end
  },

  clothes_on_heap = {
    resource_name = "c01s01_clothes_on_heap",
    layer_name = "walk_behind",
    x = 0,
    y = -300,
    render_at_start = false,
    onClick = function ()
      print ( "Say: I gave the Laundry Lady the Year Off" )
    end
  },
  
  window = {
    resource_name = "c01s01_window",
    layer_name = "objects",
    x = 720,
    y = -65,
    render_at_start = true,
    onClick = function ()
      if c01s01.objects.cellphone.woke then
        MOAILogMgr.log ( "Say: This City Never Sleeps - it just lingers in a perpetual drowsiness" )
      end
    end
  },
  room_door = {
    resource_name = "c01s01_room_door",
    layer_name = "objects",
    x = 400,
    y = -100,
    render_at_start = true,
    onClick = function ()
      if c01s01.objects.cellphone.woke then
        if not c01s01.objects.clothes_heap.dressed then 
          MOAILogMgr.log ( "Say: I should dress first" )
        else
          MOAILogMgr.log ( "Goto: c01s02" )
        end
      end
    end
  }
}

c01s01:addObjects ( objects )

c01s01.before_initialize = function ( self )
  c01s01:loadObjects ()
  c01s01.objects.cellphone.animation:startAnimation ( 'stand_by' )
  c01s01:loadCharacter( mainCharacter )
end

c01s01.after_initialize = function ( self )
  if DEBUG then
    MOAILogMgr.log ( "---------------------------------" )
    MOAILogMgr.log ( "Objects" )
    MOAILogMgr.log ( "---------------------------------" )
    dump ( c01s01.objects )
    MOAILogMgr.log ( "---------------------------------\n" )
  end
end