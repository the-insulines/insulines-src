-- path nodes
path = {
  
  start = {
    position = point (-940, -356),
    neighbors = {'alley_fork'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  alley_fork = {
    position = point (296, -616),
    neighbors = {'start', 'alley_back'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  alley_back = {
    position = point (700, -138),
    neighbors = {'alley_fork', 'club_back_door'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  club_back_door = {
    position = point (414, -112),
    neighbors = {'alley_back'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
}


-- object nodes on path
-- objectPlacementOnPath = {
--   
--   c01s03_glassglow_table = 'stuff',
--   
-- }
