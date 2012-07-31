require ('resource_cache')


----------------------------------------------------------------
-- resource table

local resourceNameTable = { 
  dummyRoomBackgroundImage = {type = IMAGE, fileName = 'background.jpeg', width = 3146, height = 960},
  guybrushTiledImage = {type = TILED_IMAGE, fileName = 'gb_walk.png', width = 624, height = 450, tileMapSize = {6, 3}},
  cityBackgroundImage0 = {type = IMAGE, fileName = 'b2_l0.png', width = 1920, height = 1200},
  cityBackgroundImage1 = {type = IMAGE, fileName = 'b2_l1.png', width = 1920, height = 1200},
  cityBackgroundImage2 = {type = IMAGE, fileName = 'b2_l2.png', width = 1920, height = 1200},
  cityBackgroundImage3 = {type = IMAGE, fileName = 'b2_l3.png', width = 1920, height = 1200},
  cityBackgroundShadowsImage = {type = IMAGE, fileName = 'b2_shadows.png', width = 1920, height = 1200},
  cityBackgroundLightsImage = {type = IMAGE, fileName = 'b2_lights.png', width = 1920, height = 1200},
}
