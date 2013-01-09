final_objectInteractions = {

  josh_surprised  = {
    highlight = true,
    onClick = function ()
      game.currentScene.sounds.background:seekVolume (0, 2, MOAIEaseType.LINEAR)
      game:switchToScene ( mainScreen )
    end
  },
  
}
