objectInteractions = {
  
  fair = {
    highlight = true,
    onClick = function ()
      game:loadScene(c01s03())
    end
  },

  venue = {
    highlight = true,
    onClick = function ()
      game:loadScene(c01s04())
    end
  },

  home  = {
    highlight = true,
    onClick = function ()
      c01s02.initialCameraPathNode = 'door'
      c01s02.initialCharacterPathNode = 'door'
      game:loadScene(c01s02)
    end
  },
  
}
