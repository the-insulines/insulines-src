c01s03_objectInteractions = {
  
  c01s03_glassglow_table = {
    onClick = function ()
      game.currentScene.objects.josh:lookAt ( game.currentScene.objects.sonja:getPosition () )
      dialog:load ( 'glasworks' )
    end,
    priority = 1,
  },
  
}
