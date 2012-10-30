objectInteractions = {
  
  fair = {
    onClick = function ()
      game:loadScene(c01s03())
    end
  },

  venue = {
    onClick = function ()
      game:loadScene(c01s04())
    end
  },

  home  = {
    onClick = function ()
      c01s02.initialCameraPathNode = 'door'
      c01s02.initialCharacterPathNode = 'door'
      game:loadScene(c01s02)
    end
  },
  
}
