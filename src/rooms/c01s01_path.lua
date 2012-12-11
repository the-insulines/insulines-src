c01s01_path = {
  bed = {
    position = point (-170, -50),
    neighbors = { 'bedBack', 'carpetPoint', 'dodgeBedPoint' },
    offsets = { x = -175, y = 0, scl = 1 }
  },

  bedBack = {
    position = point (-152, -60),
    neighbors = { 'bed', 'clothes' },
    offsets = { x = 10, y = 0 }
  },

  carpetPoint = {
    position = point (-225, -121),
    neighbors = { 'clothes', 'dodgeBedPoint', 'movePoint', 'bed' },
    offsets = { x = -175, y = 0 }
  },
  
  dodgeBedPoint = {
    position = point (-549, -182),
    neighbors = { 'bed', 'door', 'carpetPoint', 'movePoint' },
  },
  
  movePoint = {
    position = point (-170, -240),
    neighbors = { 'clothes', 'dodgeBedPoint', 'carpetPoint' },
    offsets = { x = -175, y = 0 }
  },
  
  clothes = {
    position = point (204, -156),
    neighbors = { 'bedBack', 'movePoint', 'window', 'carpetPoint' },
    offsets = { x = 10, y = 0 }
  },
  
  door = {
    position = point (-940, -108),
    neighbors = { 'dodgeBedPoint' },
    offsets = { x = -175, y = 0, scl = 1 }
  },

  window = {
    position = point (531, -296),
    neighbors = { 'clothes' },
  },
  
}
