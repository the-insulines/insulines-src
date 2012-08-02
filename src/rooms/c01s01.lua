--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

objects = {
  cellphone = {
    resource_name = "c01s01_cellphone",
    layer_name = "objects",
    x = -400,
    y = 100,
    render_at_start = true,
    clicks = 0,
    woke = false,
    onClick = function ()
      if not c01s01.objects.cellphone.woke then
        if c01s01.objects.cellphone.clicks == 2 then
          print ( "Wakes up" )
          c01s01.objects.cellphone.woke = true
          inventory:addObject ( "cellphone", c01s01.objects.cellphone )
          c01s01:stopRendering ( "cellphone" )
        else
          print ( "Moves in the bed..." )
          c01s01.objects.cellphone.clicks = c01s01.objects.cellphone.clicks + 1
        end
      end
    end

  },

  clothes_heap = {
    resource_name = "c01s01_clothes_heap",
    layer_name = "objects",
    x = -400,
    y = -100,
    render_at_start = true,
    dressed = false,
    onClick = function ()
      if c01s01.objects.cellphone.woke then
        if not c01s01.objects.clothes_heap.dressed then
          print ( "Dressing..." )
          c01s01.objects.clothes_heap.dressed = true
        else
          print ( "Say: I gave the Laundry Lady the Year Off" )
        end
      end
    end
  },
  window = {
    resource_name = "c01s01_window",
    layer_name = "objects",
    x = 400,
    y = 100,
    render_at_start = true,
    onClick = function ()
      if c01s01.objects.cellphone.woke then
        print ( "Say: This City Never Sleeps - it just lingers in a perpetual drowsiness" )
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
          print ( "Say: I should dress first" )
        else
          print ( "Goto: c01s02" )
        end
      end
    end
    
  }
}

c01s01 = room.new ( "Bedroom" )
c01s01:addObjects ( objects )

c01s01.before_initialize = function ( self )
  c01s01:loadObjects ()
end

c01s01.after_initialize = function ( self ) 
  if DEBUG then
    print ( "---------------------------------" )
    print ( "Objects" )
    print ( "---------------------------------" )
    dump ( c01s01.objects )
    print ( "---------------------------------" )
  end
end