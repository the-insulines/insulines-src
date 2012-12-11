c01s01_objects = {
  background = {
    resource_name = 'c01s01_background',
    layer_name = 'background',
    x = 0,
    y = 0,
    render_at_start = true,
  },
  
  floyd = {
    resource_name = "c01s01_poster_star_floyd",
    layer_name = "back_objects",
    x = 383,
    y = 320,
    render_at_start = true,
  },
  
  barbarullo = {
    resource_name = "c01s01_poster_barbarullo",
    layer_name = "back_objects",
    x = -390,
    y = 350,
    render_at_start = true,
  },
  
  josh_sleeping = {
    resource_name = "josh_sleeping",
    layer_name = "back_objects",
    animated = true,
    x = -203,
    y = 210,
    render_at_start = true,
  },
  
  josh_wakes_up = {
    resource_name = "josh_wakes_up",
    layer_name = "back_objects",
    animated = true,
    x = -313,
    y = 183,
    render_at_start = false,
  },

  josh_grabs_cellphone = {
    resource_name = "josh_grabs_cellphone",
    layer_name = "back_objects",
    animated = true,
    x = -151,
    y = 214,
    render_at_start = false,
  },

  nightstand = {
    resource_name = 'c01s01_nightstand',
    layer_name = 'objects',
    x = -48,
    y = 62,
    render_at_start = true,
  },

  cellphone = {
    resource_name = "c01s01_cellphone",
    inventory_resource_name = "inventory_cellphone",
    layer_name = "objects",
    highlight = true,
    animated = true,
    animationType = AnimatedProp.ANIMATION_TYPE_SPRITESHEET,
    animations = {
      {'calling', 1, 11, 0.10},
      --{'calling', 3, 2, 1},
    },
    x = -30,
    y = 110,
    render_at_start = true,
  },

  clothes_heap = {
    resource_name = "c01s01_clothes_heap",
    layer_name = "walk_behind",
    x = 40,
    y = -350,
    render_at_start = true,
  },

  clothes_on_heap = {
    resource_name = "c01s01_clothes_on_heap",
    layer_name = "objects",
    x = 40 + 257 / 2,
    y = -350,
    render_at_start = false,
  },
  
  window = {
    resource_name = "c01s01_window",
    layer_name = "objects",
    x = 850,
    y = -75,
    render_at_start = true,
  },

  walk_behind = {
    resource_name = 'c01s01_walk_behind',
    layer_name = 'objects',
    x = -570,
    y = -458,
    render_at_start = true,
  },

  room_door = {
    resource_name = "c01s01_room_door",
    layer_name = "objects",
    x = -1034,
    y = 213,
    render_at_start = true,
  },
  
  room_door_open = {
    resource_name = "c01s01_room_door_open",
    layer_name = "walk_behind",
    x = -1035,
    y = 196,
    render_at_start = false,
  }
  
}
