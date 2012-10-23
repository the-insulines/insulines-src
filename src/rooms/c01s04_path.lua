-- path nodes
path = {
  
  start = {
    position = point (-940, -356),
    neighbors = {'turn_light_off_node'},
    offsets = { x = 0, y = 0, scl = 1.0 },
  },
  
  turn_light_off_node = {
    position = point (50, -568),
    neighbors = {'start', 'alley_turn'},
    offsets = { x = 0, y = 0, scl = 1.0 },
    action = function ()
      game.currentScene:alleyLightAction ()
    end,
  },
  
  alley_turn = {
    position = point (296, -616),
    neighbors = {'turn_light_off_node', 'alley_shadow'},
    offsets = { x = 0, y = 0, scl = 1.0 },
  },
  
  alley_shadow = {
    position = point (402, -502),
    neighbors = {'alley_turn', 'alley_back'},
    offsets = { x = 0, y = 0, scl = 1.0 },
    action = function ()
      game.currentScene:walkIntoAlleyAction ()
    end,
  },
  
  alley_back = {
    position = point (700, -138),
    neighbors = {'alley_shadow', 'club_back_door'},
    offsets = { x = 0, y = 0, scl = 1.0 },
  },
  
  club_back_door = {
    position = point (414, -112),
    neighbors = {'alley_back'},
    offsets = { x = 0, y = 0, scl = 1.0 },
  },
  
}


-- object nodes on path
-- objectPlacementOnPath = {
--   
--   c01s03_glassglow_table = 'stuff',
--   
-- }
