objectInteractions = {
  
  c01s04_door_closed = {
    onClick = function ( room )
      game.currentScene:stopRendering ( 'c01s04_door_closed' )
      game.currentScene:startRendering ( 'c01s04_door_opened' )
    end,
    priority = 1,
  },
  
}
