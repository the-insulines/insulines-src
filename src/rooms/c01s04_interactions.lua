c01s04_objectInteractions = {
  c01s04_door_closed = {
    onClick = function ()
      if stateManager.state.dialogs.userVariables["backstage"] then
        local scene = game.currentScene
        scene:stopRendering ( 'c01s04_door_closed' )
        
        scene.objects.c01s04_door_opened.prop:setColor ( scene.shadowColor, scene.shadowColor, scene.shadowColor )
        scene:startRendering ( 'c01s04_door_opened' )
      else
        dialog:load('door')
      end
    end,
    priority = 1,
  },
  c01s04_door_opened = {
    onClick = function ()
      if game.currentScene.sounds.background:isPlaying () then
        game.currentScene.sounds.background:stop ()
      end
      game:switchToScene( final )
    end
  }
}
