objectInteractions = {
  background = {
    avoid_clicks = true
  },
  
  floyd = {
    onClick = function ()
      if stateManager.woke then
        dialog:load('spacestation')
      end
    end
  },
  
  barbarullo = {
    onClick = function ()
      if stateManager.woke then
        dialog:load('barbarulo')
      end
    end
  },
  
  josh_sleeping = {
    avoid_clicks = true
  },
  
  josh_wakes_up = {
    avoid_clicks = true,
    onEnd = function () 
      game.currentScene.inputEnabled = true
    end
  },

  josh_grabs_cellphone = {
    avoid_clicks = true,
    onEnd = function ()
    end,
    wakingUp = function ()
      -- Get Cellphone
      stateManager.cellphonePicked = true

      print (" MOVE THIS TO A GENERIC POLLING THAT RENDERS THE HUD IF STATE MANAGER IS CHANGED ")
      cellphoneHUD:show()
      
      game.currentScene:stopRendering ( "cellphone" )
      game.currentScene:startRendering ( "nightstand" )
      game.currentScene:stopRendering ( "josh_grabs_cellphone" )
      game.currentScene:startRendering ( "josh_wakes_up" )
      
      game.currentScene.sounds.cellphone:stop ()
      
      local anim = game.currentScene.objects.josh_wakes_up.animation:startAnimation ( 'wakes_up' )
      anim:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, game.currentScene.objects.josh_wakes_up.onEnd )
    end
  },

  nightstand = {
    avoid_clicks = true,
  },

  cellphone = {
    clicks = 0,
    woke = false,
    calling = function ( self )
      self.animation:startAnimation ( 'calling' )
      game.currentScene.sounds.cellphone:play ()
      self.action = self.prop:moveLoc ( 7, 7, 5, MOAIEaseType.LINEAR )
    end,
    
    onClick = function ( self )
      if not stateManager.woke then
        if stateManager.cellphoneClicks < 2 then
          if stateManager.cellphoneClicks == 0 then
            self:firstClickReaction ()
          else
            self:secondClickReaction ()
          end
          stateManager.cellphoneClicks = stateManager.cellphoneClicks + 1
        else
          self:wakeUp ()
        end
      end
    end,
    
    firstClickReaction = function ( self )
      -- stop the sleeping animation
      game.currentScene:stopRendering ( "josh_sleeping" )
      game.currentScene.objects.josh_sleeping.animation:stopCurrentAnimation ()
      
      game.currentScene:stopRendering ( "nightstand" )
      
      local anim = game.currentScene.objects.josh_grabs_cellphone.animation:startAnimation ( 'grabs_cellphone' )
      anim:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, game.currentScene.objects.josh_grabs_cellphone.onEnd )
      game.currentScene:startRendering ( "josh_grabs_cellphone" )
      
      self.action:stop ()
      self.action = self.prop:moveLoc ( 3 / SCREEN_TO_WORLD_RATIO, -5 / SCREEN_TO_WORLD_RATIO, 3, MOAIEaseType.LINEAR )
    end,

    secondClickReaction = function ( self )
      -- stop the still animation when he is grabbing the cellphone
      game.currentScene.objects.josh_grabs_cellphone.animation:stopCurrentAnimation ()
      
      local anim = game.currentScene.objects.josh_grabs_cellphone.animation:startAnimation ( 'grabs_cellphone_loop' )
      self.action:stop ()
      self.action = self.prop:moveLoc ( -8 / SCREEN_TO_WORLD_RATIO, 0, 2, MOAIEaseType.LINEAR )
    end,

    wakeUp = function ( self )

      -- Stop animation on cellphone
      self.animation:stopCurrentAnimation ()

      -- Disable input while showing wakeup animation
      game.currentScene.inputEnabled = false

      self.action = self.prop:moveLoc ( -20 / SCREEN_TO_WORLD_RATIO, 0, 3, MOAIEaseType.LINEAR )
      game.currentScene.objects.clothes_heap.highlight = true
      local anim = game.currentScene.objects.josh_grabs_cellphone.animation:startAnimation ( 'grabs_cellphone_loop' )
      anim:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, game.currentScene.objects.josh_grabs_cellphone.wakingUp )
      stateManager.woke = true
      game.currentScene.objects.window.highlight = true
      game.currentScene.objects.barbarullo.highlight = true
      game.currentScene.objects.floyd.highlight = true
      game.currentScene.objects.walk_behind.highlight = true
    end
  },

  clothes_heap = {
    dressed = false,
    onClick = function ()

      local fadeIn = function ()
        game.currentScene:fadeIn ()
        
        -- stop still animation
        game.currentScene.objects.josh_wakes_up.animation:stopCurrentAnimation ()
        
        game.currentScene:stopRendering ( "josh_wakes_up" )
        game.currentScene:stopRendering ( "clothes_heap" )
        game.currentScene:startRendering ( "clothes_on_heap" )
        game.currentScene:startRendering ( "josh" )
        game.currentScene:resetCharacter ()
        game.currentScene.objects.josh:startAnimation ( 'stand_front' )
        game.currentScene.sounds.ambient:stop ()
        game.currentScene.sounds.background:play ()
        game.currentScene.objects.clothes_on_heap.highlight = true
      end
      
      if stateManager.woke then
        if not game.currentScene.objects.clothes_heap.dressed then
          game.currentScene:fadeOut ()
          performWithDelay (100, fadeIn, 1, game.currentScene)
          game.currentScene.objects.clothes_heap.dressed = true
        end
      end
    end
  },

  clothes_on_heap = {
    onClick = function ()
      dialog:load("clothes")
    end
  },
  
  window = {
    onClick = function ()
      if stateManager.woke then
        dialog:load("window")
      end
    end
  },

  walk_behind = {
    onClick = function ()
      if stateManager.woke then
        dialog:load('duck')
      end
    end
  },

  room_door = {
    onClick = function ()
      if game.currentScene.objects.clothes_heap.dressed then
        game.currentScene:stopRendering( "room_door" )
        game.currentScene:startRendering( "room_door_open" )
        game.currentScene.objects.room_door_open.onClick ()
      else
        if stateManager.woke then 
          dialog:load('c01s01_put_clothes_' .. math.random(4))
        end
      end
    end
  },
  
  room_door_open = {
    onClick = function ()
      if game.currentScene.objects.clothes_heap.dressed then
        c01s02.initialCameraPathNode = 'joshDoor'
        c01s02.initialCharacterPathNode = 'joshDoor'
        game:switchToScene ( c01s02 )
      end
    end
  }
  
}
