-- path nodes
path = {
  
  start = {
    position = point (-470, 32),
    neighbors = {'pete_and_paul_fork'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  pete_and_paul_fork = {
    position = point ( -214, -214 ), -- point (-146, -216),
    neighbors = {'start', 'foam_fork', 'stuff'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  foam_fork = {
    position = point ( -56, -360 ),
    neighbors = {'pete_and_paul_fork', 'foam', 'stuff', 'bottle_emporium'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  foam = {
    position = point (90, -314),
    neighbors = {'foam_fork'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  bottle_emporium = {
    position = point (476, -540),
    neighbors = {'foam_fork'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
  stuff = {
    position = point (-220, -514),
    neighbors = {'foam_fork', 'pete_and_paul_fork'},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
  
}


-- object nodes on path
objectPlacementOnPath = {
  
  c01s03_glassglow_table = 'stuff',
  
}
