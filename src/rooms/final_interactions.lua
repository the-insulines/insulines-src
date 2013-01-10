final_objectInteractions = {

  josh_surprised  = {
    highlight = true,
    onClick = function ()
      game.currentScene.sounds.background:seekVolume (0, 2, MOAIEaseType.LINEAR)
      if game.currentScene.sounds.background:isPlaying () then
        game.currentScene.sounds.background:stop ()
      end
      game:switchToScene ( creditsScreen )

      local s = mainScreen ()
      game.currentScene.backScreen = s
      
    end
  },
  
}
