map_objectInteractions = {
  
  fair = {
    highlight = true,
    render_at_start = stateManager.state.map.fair,
    onClick = function ()
      game:switchToScene( c01s03 )
    end
  },

  venue = {
    highlight = true,
    render_at_start = stateManager.state.map.venue,
    onClick = function ()
      game:switchToScene( c01s04 )
    end
  },

  home  = {
    highlight = true,
    onClick = function ()
      game:switchToScene(c01s02, 'door', 'door')
    end
  },
  
}
