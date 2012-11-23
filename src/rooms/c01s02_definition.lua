c01s02_objects = {
  background = {
    resource_name = 'c01s02_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
  },
  
  table = {
    resource_name = 'c01s02_table',
    layer_name = 'walk_behind',
    x = -196,
    y = -452,
    render_at_start = true
  },

  bob_bedroom_closed = {
    resource_name = 'c01s02_bob_bedroom_closed',
    layer_name = 'objects',
    x = -676,
    y = 0,
    render_at_start = true,
  },

  bedroom_opened = {
    resource_name = 'c01s02_bedroom_opened',
    layer_name = 'objects',
    x = 1120,
    y = -10,
    render_at_start = true,
  },
  
  blue_chairs = {
    resource_name = 'c01s02_chairs',
    layer_name = 'walk_behind',
    x = -170,
    y = -502,
    render_at_start = true,
    renderPriority = 100,
  },
  
  couch = {
    resource_name = 'c01s02_couch',
    layer_name = 'walk_behind',
    x = 1086,
    y = -427,
    render_at_start = true,
  },

  television = {
    resource_name = 'c01s02_tv',
    layer_name = 'walk_behind',
    x = 1233,
    y = -664,
    render_at_start = true,
    renderPriority = 10,
    priority = 10,
    highlight = true,
  },

  answering_machine = {
    resource_name = "c01s01_answering_machine",
    layer_name = "objects",
    highlight = true,
    animated = true,
    animations = {
      -- BUG:
      -- For some reason it's not working with { 'blink', 1, 2, 0.5 }
      -- even if the frameCount is 2
      { 'blink', 1, 3, 0.5 },
      { 'stopped', 1, 1, 0.1 }
    },
    x = -1280,
    y = -190,
    render_at_start = true,
  },
  
  -- ------------------------------------------------------
  -- Bathroom Puzzle
  -- ------------------------------------------------------
  
  bathroom_closed = {
    resource_name = 'c01s02_bathroom_closed',
    layer_name = 'objects',
    x = 1798,
    y = -217,
    render_at_start = true,
  },
  
  bathroom_opened = {
    resource_name = 'c01s02_bathroom_opened',
    layer_name = 'walk_behind',
    x = 1780,
    y = -250,
    render_at_start = false,
  },
  
  toothpaste = {
    inventory_resource_name = "inventory_toothpaste",
    render_at_start = false,
  },
  
  toothbrush = {
    inventory_resource_name = "inventory_toothbrush",
    render_at_start = false,
  },

  toothbrush_with_toothpaste = {
    inventory_resource_name = "inventory_toothbrush_with_toothpaste",
    render_at_start = false,
  },
  
  floss = {
    inventory_resource_name = "inventory_floss",
    render_at_start = false
  },
  
  -- ------------------------------------------------------
  -- End Bathroom Puzzle
  -- ------------------------------------------------------
  
  -- ------------------------------------------------------
  -- Fridge
  -- ------------------------------------------------------
  
  freezer_closed = {
    resource_name = 'c01s02_freezer_closed',
    layer_name = 'objects',
    x = 752,
    y = 296,
    renderPriority = 100,
    render_at_start = true,
  },

  freezer_opened = {
    resource_name = 'c01s02_freezer_opened',
    layer_name = 'objects',
    x = 754,
    y = 277,
    renderPriority = 100,
    render_at_start = false,
    highlight = true,
  },

  fridge_closed = {
    resource_name = 'c01s02_fridge_closed',
    layer_name = 'objects',
    x = 751,
    y = 129,
    render_at_start = true,
  },  

  fridge_opened = {
    resource_name = 'c01s02_fridge_opened',
    layer_name = 'objects',
    x = 751,
    y = 108,
    render_at_start = false,
    highlight = true,
  },  
  
  -- ------------------------------------------------------
  -- End Fridge
  -- ------------------------------------------------------
  
  -- -----------------------------------------------------------------
  -- Coffee Puzzle
  -- -----------------------------------------------------------------
  
  coffeeMaker = {
    resource_name = 'c01s02_coffeemaker',
    layer_name = 'objects',
    x = 439 - 10 + 35,
    y = 178 + 43 + 58,
    -- x = 374,
    -- y = 270,
    render_at_start = true,
    animated = true,
    highlight = true,
  },
  
  pantry_closed = {
    resource_name = 'c01s02_pantry_closed',
    layer_name = 'objects',
    x = 572,
    y = 65,
    render_at_start = true,
    highlight = true,
  },
  
  pantry_opened = {
    resource_name = 'c01s02_pantry_opened',
    layer_name = 'objects',
    x = 563,
    y = 53,
    render_at_start = false,
  },

  coffeePackage = {
    resource_name = 'c01s02_coffee',
    inventory_resource_name = "inventory_coffee",
    layer_name = 'objects',
    x = 563,
    y = 53,
    render_at_start = false,
    highlight = true,
  },

  coffeePotEmpty = {
    resource_name = 'c01s02_coffee_pot_empty',
    inventory_resource_name = "inventory_coffee_pot_empty",
    layer_name = 'objects',
    x = 374 - 30,
    y = 270 - 95,
    highlight = true,
    render_at_start = true,
    priority = 10,
    renderPriority = 100,
  },

  coffeePotWater = {
    inventory_resource_name = "inventory_coffee_pot_water",
  },

  coffeePotFull = {
    resource_name = 'c01s02_coffee_pot_full',
    layer_name = 'objects',
    x = 439,
    y = 178,
    render_at_start = false,
    renderPriority = 100
  },
  
  mug_full = {
    resource_name = "c01s02_mug_full_smoke",
    animated = true,
    layer_name = 'objects',
    x = 350,
    y = 178 + 136/2,
    render_at_start = false,
  },

  mug_empty = {
    resource_name = 'c01s02_mug_empty',
    layer_name = 'objects',
    x = 350,
    y = 178,
    render_at_start = false,
  },
  
  sink = {
    resource_name = "c01s02_sink",
    layer_name = "objects",
    x = 555,
    y = 195,
    render_at_start = true,
    animated = true,
    animations = {
      { 'stopped', 1, 1, 0.1 },
      { 'flowing', 2, 1, 0.1 }
    },
    
    highlight = true,
  },
  
  -- ------------------------------------------------------
  -- End Coffee Puzzle
  -- ------------------------------------------------------
  
  -- -----------------------------------------------------------------
  -- Nancy Puzzle
  -- -----------------------------------------------------------------
  
  apartmentDoor = {
    resource_name = 'c01s02_apartment_door_closed',
    layer_name = 'objects',
    x = -1584,
    y = -249,
    render_at_start = true,
  },
  
  apartmentDoorOpened = {
    resource_name = 'c01s02_apartment_door_opened',
    layer_name = 'walk_behind',
    x = -1540,
    y = -276,
    render_at_start = false,
  },

  flyer = {
    resource_name = 'c01s02_fair_flyer',
    inventory_resource_name = "inventory_flyer",
    layer_name = 'objects',
    x = -1554,
    y = -149,
    render_at_start = true,
    highlight = true,
  },
  
  -- -----------------------------------------------------------------
  -- End Nancy Puzzle
  -- -----------------------------------------------------------------
  
}
