final_objectInteractions = {

  josh_surprised  = {
    highlight = true,
    onClick = function ()
      game.currentScene.sounds.background:seekVolume (0, 2, MOAIEaseType.LINEAR)
      game:switchToScene ( creditsScreen )

      local s = mainScreen ()
      game.currentScene.backScreen = s
      
    end
  },
  
}
