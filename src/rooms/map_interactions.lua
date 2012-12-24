map_objectInteractions = {
  
  fair = {
    highlight = true,
    render_at_start = stateManager.map.fair,
    onClick = function ()
      game:loadScene( c01s03 )
    end
  },

  venue = {
    highlight = true,
    render_at_start = stateManager.map.venue,
    onClick = function ()
      game:loadScene( c01s04 )
    end
  },

  home  = {
    highlight = true,
    onClick = function ()
      game:loadScene(c01s02, 'door', 'door')
    end
  },
  
}
