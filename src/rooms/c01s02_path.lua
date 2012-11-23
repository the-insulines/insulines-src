-- path nodes
path = {
  livingNodeLeft = {
    position = point (-398, -340),
    neighbors = { 'beforeBobbyDoor', 'kitchenLeftOut' },
    offsets = { x = -190, y = 0 }
  },

  beforeBobbyDoor = {
    position = point (-711, -350),
    neighbors = { 'livingNodeLeft', 'carpet', 'bobbyDoor' },
    offsets = { x = -850, y = 0 }
  },

  bobbyDoor = {
    position = point (-690, -237),
    neighbors = { 'beforeBobbyDoor' },
  },

  carpet = {
    position = point (-873, -343),
    neighbors = { 'beforeBobbyDoor', 'beforeAnswering' },
  },

  beforeAnswering = {
    position = point (-1016, -408),
    neighbors = { 'carpet', 'beforeDoor', 'answering' },
  },

  answering = {
    position = point (-1172, -341),
    neighbors = { 'beforeAnswering', 'beforeDoor' },
  },

  beforeDoor = {
    position = point (-1251, -500),
    neighbors = { 'beforeAnswering', 'door', 'answering' },
  },

  door = {
    position = point (-1538, -500),
    neighbors = { 'beforeDoor' },
    offsets = { x = -850, y = 0, scl = 0.9 }
  },

  kitchenLeft = {
    position = point (117, -26),
    neighbors = { 'kitchenLeftOut', 'kitchenRight' },
    offsets = { x = 400, y = 200, scl = 0.6 }
  },

  kitchenLeftOut = {
    position = point (114, -29),
    neighbors = { 'livingNodeLeft', 'kitchenLeft' },
    offsets = { x = -190, y = 0, scl = 0.9 }
  },

  kitchenRight = {
    position = point (737, -26),
    neighbors = { 'kitchenLeft', 'zoomKitchenRight' },
  },

  zoomKitchenRight = {
    position = point (728, -60),
    neighbors = { 'kitchenRight', 'zoomKitchenRightOut' },
    offsets = { x = 500, y = 200, scl = 0.6 }   
  },

  zoomKitchenRightOut = {
    position = point (720, -90),
    neighbors = { 'zoomKitchenRight', 'livingNodeRight' },
    offsets = { x = 900, y = 0, scl = 0.9 }
  },

  livingNodeRight = {
    position = point (645, -270),
    neighbors = { 'zoomKitchenRightOut', 'joshDoor' },
  },

  joshDoor = {
    position = point (1130, -245),
    neighbors = { 'livingNodeRight', 'lamp' },
    offsets = { x = 900, y = 0, scl = 0.9 }
  },

  lamp = {
    position = point (1387, -277),
    neighbors = { 'joshDoor', 'bathroomDoor' },
    offsets = { x = 990, y = 0, scl = 0.9 }
  },

  bathroomDoor = {
    position = point (1742, -429),
    neighbors = { 'lamp', 'bathroom' },
  
  },

  bathroom = {
    position = point (1842, -429),
    neighbors = { 'bathroomDoor' },
  }

}
