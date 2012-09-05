--==============================================================
-- The Insulines - Chapter 01 / Scene 01 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

c01s01 = room.new ( "c01s01" )


-- perspective attributes
c01s01.frontCharacterZoom = 0.9
c01s01.bottomCharacterZoomThreshold = -500
c01s01.backCharacterZoom = 0.85
c01s01.topCharacterZoomThreshold = -66

c01s01.initialCameraPathNode = 'bed'
c01s01.initialCharacterPathNode = 'movePoint'

c01s01.characterMovement = false
objects = {
  background = {
    resource_name = 'c01s01_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
    avoid_clicks = true
  },
  
  floyd = {
    resource_name = "c01s01_poster_star_floyd",
    layer_name = "back_objects",
    x = 383,
    y = 265,
    render_at_start = true,
  },
  
  barbarullo = {
    resource_name = "c01s01_poster_barbarullo",
    layer_name = "back_objects",
    x = -336,
    y = 328,
    render_at_start = true,
  },
  
  josh_sleeping = {
    resource_name = "josh_sleeping",
    layer_name = "back_objects",
    animated = true,
    x = -321,
    y = 116,
    render_at_start = true,
    avoid_clicks = true
  },
  
  josh_wakes_up = {
    resource_name = "josh_wakes_up",
    layer_name = "back_objects",
    animated = true,
    animationType = AnimatedProp.ANIMATION_TYPE_SPRITESHEET,
    animations = {
      {'wakes_up', 1, 30, JOSH_WAKES_SECONDS_PER_FRAME, MOAITimer.NORMAL},
      {'still', 30, 1, JOSH_WAKES_SECONDS_PER_FRAME},
    },
    x = -312,
    y = 180,
    render_at_start = false,
    avoid_clicks = true,
    onEnd = function () 
      c01s01:stopRendering ( "josh_grabs_cellphone" )
      c01s01.objects.josh_wakes_up.animation:startAnimation("still")
      c01s01.inputEnabled = true
    end
  },

  josh_grabs_cellphone = {
    resource_name = "josh_grabs_cellphone",
    layer_name = "back_objects",
    animated = true,
    x = -279,
    y = 77,
    render_at_start = false,
    avoid_clicks = true,
    
    onEnd = function ()
      -- c01s01.objects.josh_grabs_cellphone.animation:ssAnimation("still")
    end,
    
    wakingUp = function ()
      -- Get Cellphone
      inventory:addItem ( "cellphone", c01s01.objects.cellphone )
      c01s01:stopRendering ( "cellphone" )
      c01s01:startRendering ( "nightstand" )
      c01s01:startRendering ( "josh_wakes_up" )
      
      c01s01.sounds.cellphone:stop ()
      
      local anim = c01s01.objects.josh_wakes_up.animation:startAnimation ( 'wakes_up' )
      anim:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, c01s01.objects.josh_wakes_up.onEnd )
    end
  },

  nightstand = {
    resource_name = 'c01s01_nightstand',
    layer_name = 'objects',
    x = -40,
    y = 54,
    render_at_start = true,
    avoid_clicks = true,
  },

  cellphone = {
    resource_name = "c01s01_cellphone",
    inventory_resource_name = "inventory_cellphone",
    layer_name = "objects",
    highlight = true,
    animated = true,
    animationType = AnimatedProp.ANIMATION_TYPE_SPRITESHEET,
    animations = {
      {'calling', 1, 11, 0.10},
      --{'calling', 3, 2, 1},
    },
    x = -30,
    y = 110,
    render_at_start = true,
    clicks = 0,
    woke = false,
    calling = function ()
      c01s01.objects.cellphone.animation:startAnimation ( 'calling' )
      c01s01.sounds.cellphone:play ()
      c01s01.objects.cellphone.action = c01s01.objects.cellphone.prop:moveLoc ( 7, 7, 5, MOAIEaseType.LINEAR )
    end,
    
    onClick = function ()
      if not c01s01.objects.cellphone.woke then
        
        -- third click
        if c01s01.objects.cellphone.clicks == 2 then
          -- Wake up
          c01s01.objects.cellphone.animation:stopCurrentAnimation ()
          c01s01.inputEnabled = false
          c01s01.objects.cellphone.action = c01s01.objects.cellphone.prop:moveLoc ( -20, 0, 3, MOAIEaseType.LINEAR )
          c01s01.objects.clothes_heap.highlight = true
          local anim = c01s01.objects.josh_grabs_cellphone.animation:startAnimation ( 'grabs_cellphone_loop' )
          anim:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, c01s01.objects.josh_grabs_cellphone.wakingUp )
          c01s01.objects.cellphone.woke = true
        else
          
          -- first click
          if c01s01.objects.cellphone.clicks == 0 then
            -- stop the sleeping animation
            c01s01:stopRendering ( "josh_sleeping" )
            c01s01.objects.josh_sleeping.animation:stopCurrentAnimation ()
            
            c01s01:stopRendering ( "nightstand" )
            
            local anim = c01s01.objects.josh_grabs_cellphone.animation:startAnimation ( 'grabs_cellphone' )
            anim:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, c01s01.objects.josh_grabs_cellphone.onEnd )
            c01s01:startRendering ( "josh_grabs_cellphone" )
            
            c01s01.objects.cellphone.action:stop ()
            c01s01.objects.cellphone.action = c01s01.objects.cellphone.prop:moveLoc ( 3, -5, 3, MOAIEaseType.LINEAR )
            
          else
            
            -- second click
            -- stop the still animation when he is grabbing the cellphone
            c01s01.objects.josh_grabs_cellphone.animation:stopCurrentAnimation ()
            
            local anim = c01s01.objects.josh_grabs_cellphone.animation:startAnimation ( 'grabs_cellphone_loop' )
            c01s01.objects.cellphone.action:stop ()
            c01s01.objects.cellphone.action = c01s01.objects.cellphone.prop:moveLoc ( -8, 0, 2, MOAIEaseType.LINEAR )
          end

          c01s01.objects.cellphone.clicks = c01s01.objects.cellphone.clicks + 1
        end
      end
    end
  },

  clothes_heap = {
    resource_name = "c01s01_clothes_heap",
    layer_name = "walk_behind",
    x = 40,
    y = -350,
    render_at_start = true,
    dressed = false,
    onClick = function ()

      local fadeIn = function ()
        c01s01:fadeIn ()
        
        -- stop still animation
        c01s01.objects.josh_wakes_up.animation:stopCurrentAnimation ()
        
        c01s01:stopRendering ( "josh_wakes_up" )
        c01s01:stopRendering ( "clothes_heap" )
        c01s01:startRendering ( "clothes_on_heap" )
        c01s01:startRendering ( "main_character" )
        c01s01:resetCharacter ()
        c01s01.sounds.background:play ()
        c01s01.objects.clothes_on_heap.highlight = true
        c01s01.objects.window.highlight = true
        c01s01.objects.barbarullo.highlight = true
        c01s01.objects.floyd.highlight = true
        
      end

      if c01s01.objects.cellphone.woke then
        if not c01s01.objects.clothes_heap.dressed then
          c01s01:fadeOut ()
          performWithDelay (100, fadeIn, 1, c01s01)
          c01s01.objects.clothes_heap.dressed = true
        end
      end
    end
  },

  clothes_on_heap = {
    resource_name = "c01s01_clothes_on_heap",
    layer_name = "objects",
    x = 40,
    y = -350,
    render_at_start = false,
    onClick = function ()
      dialog:load("c01s01_laundry")
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
        dialog:load("c01s01_never_sleeps")
      end
    end
  },

  walk_behind = {
    resource_name = 'c01s01_walk_behind',
    layer_name = 'objects',
    x = -400,
    y = -386,
    render_at_start = true,
    avoid_clicks = true
  },

  room_door = {
    resource_name = "c01s01_room_door",
    layer_name = "objects",
    x = -870,
    y = 180,
    render_at_start = true,
    onClick = function ()
      if c01s01.objects.clothes_heap.dressed then
        c01s01:stopRendering( "room_door" )
        c01s01:startRendering( "room_door_open" )
        c01s01.objects.room_door_open.onClick ()
      end
    end
  },
  
  room_door_open = {
    resource_name = "c01s01_room_door_open",
    layer_name = "walk_behind",
    x = -872,
    y = 165,
    render_at_start = false,
    onClick = function ()
      if c01s01.objects.clothes_heap.dressed then
        c01s01:unload ()

        c01s02.initialCameraPathNode = 'joshDoor'
        c01s02.initialCharacterPathNode = 'joshDoor'

        performWithDelay (100, game.loadScene, 1, game, c01s02)
      end
    end
  }
  
}

c01s01:addObjects ( objects )

sounds = {
  
  ambient = {
    resource_name = 'c01s01_ambient'
  },
  
  cellphone = {
    resource_name = 'c01s01_cellphone_ringtone'
  },
  
  background = {
    resource_name = 'c01s01_theme'
  }
  
}

c01s01:addSounds( sounds )

function c01s01:beforeInitialize ()
  self:loadObjects ()
  self:loadSounds ()
  self:loadCharacter( mainCharacter )
end

function c01s01:afterInitialize ()
  self.objects.cellphone.calling () 
  self.objects.josh_sleeping.animation:startAnimation ( 'sleeps' )
  self:stopRendering( 'main_character' )
  
  
  self.characterMovement = false
end

local path = {
  bed = {
    position = point (-170, -50),
    neighbors = { 'bedBack', 'carpetPoint', 'dodgeBedPoint' },
    offsets = { x = -190, y = 0, scl = 0.8 }
  },

  bedBack = {
    position = point (-152, -60),
    neighbors = { 'bed', 'clothes' },
    offsets = { x = 0, y = 0 }
  },

  carpetPoint = {
    position = point (-225, -121),
    neighbors = { 'clothes', 'dodgeBedPoint', 'movePoint', 'bed' },
    offsets = { x = -190, y = 0 }
  },
  
  dodgeBedPoint = {
    position = point (-410, -150),
    neighbors = { 'bed', 'door', 'carpetPoint', 'movePoint' },
  },
  
  movePoint = {
    position = point (-170, -200),
    neighbors = { 'clothes', 'dodgeBedPoint', 'carpetPoint' },
    offsets = { x = -190, y = 0 }
  },
  
  clothes = {
    position = point (121, -144),
    neighbors = { 'bedBack', 'movePoint', 'window', 'carpetPoint' },
    offsets = { x = 0, y = 0 }
  },
  
  door = {
    position = point (-788, -120),
    neighbors = { 'dodgeBedPoint' },
    offsets = { x = -190, y = 0, scl = 0.8 }
  },

  window = {
    position = point (450, -260),
    neighbors = { 'clothes' },
  },
  
}

-- Walk path
c01s01:loadPath(path)
