  path = {
    bed = {
      position = point (-170, -50),
      neighbors = { 'bedBack', 'carpetPoint', 'dodgeBedPoint' },
      offsets = { x = -190, y = 0, scl = 0.8 }
    },

    bedBack = {
      position = point (-152, -60),
      neighbors = { 'bed', 'clothes' },
      offsets = { x = 0, y = 0 }
    },

    carpetPoint = {
      position = point (-225, -121),
      neighbors = { 'clothes', 'dodgeBedPoint', 'movePoint', 'bed' },
      offsets = { x = -190, y = 0 }
    },
    
    dodgeBedPoint = {
      position = point (-410, -150),
      neighbors = { 'bed', 'door', 'carpetPoint', 'movePoint' },
    },
    
    movePoint = {
      position = point (-170, -200),
      neighbors = { 'clothes', 'dodgeBedPoint', 'carpetPoint' },
      offsets = { x = -190, y = 0 }
    },
    
    clothes = {
      position = point (121, -144),
      neighbors = { 'bedBack', 'movePoint', 'window', 'carpetPoint' },
      offsets = { x = 0, y = 0 }
    },
    
    door = {
      position = point (-788, -120),
      neighbors = { 'dodgeBedPoint' },
      offsets = { x = -190, y = 0, scl = 0.8 }
    },

    window = {
      position = point (450, -260),
      neighbors = { 'clothes' },
    },
    
  }
