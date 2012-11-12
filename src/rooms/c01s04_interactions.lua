objectInteractions = {
  
  c01s04_door_closed = {
    onClick = function ()
      local scene = game.currentScene
      scene:stopRendering ( 'c01s04_door_closed' )
      
      scene.objects.c01s04_door_opened.prop:setColor ( scene.shadowColor, scene.shadowColor, scene.shadowColor )
      scene:startRendering ( 'c01s04_door_opened' )
    end,
    priority = 1,
  },
  
}
