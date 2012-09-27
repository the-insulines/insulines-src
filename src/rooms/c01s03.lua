--==============================================================
-- The Insulines - Chapter 01 / Scene 03 / Bedroom
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

c01s03 = room.new ( "c01s03" )

c01s03.frontCharacterZoom = 0.9
c01s03.bottomCharacterZoomThreshold = -611

c01s03.backCharacterZoom = 0.3
c01s03.topCharacterZoomThreshold = 323

c01s03.initialCameraPathNode = 'behind_tree'
c01s03.initialCharacterPathNode = 'behind_tree'


c01s03.hasExternalAssets = true


-- old_objects = {
--   background = {
--     resource_name = 'c01s03_background',
--     layer_name = 'background',
--     x = 0,
--     y = 0,
--     render_at_start = true,
--     avoid_clicks = true
--   },
--   
--   background_trees = {
--     resource_name = 'c01s03_background_trees',
--     layer_name = 'background',
--     x =  0,
--     y = 0,
--     render_at_start = true,
--     avoid_clicks = true,
--   },
--   
--   walkbehind_trees = {
--     resource_name = 'c01s03_walkbehind_trees',
--     layer_name = 'walk_behind',
--     x =  0,
--     y = 0,
--     render_at_start = true,
--     avoid_clicks = true,
--   },
-- }

objects = {
  
  c01s03_background = {
    layer_name = 'background',
    type = RESOURCE_TYPE_IMAGE,
    x = 0, y = -160,
    width = 1920, height = 1440,
    resource_name = 'c01s03/c01s03_background.png',
    render_at_start = true,
  },
  
  c01s03_nubes_ventanas_ciudad = {
    layer_name = 'background',
    type = RESOURCE_TYPE_IMAGE,
    x = 0, y = -81.127457,
    width = 1915.775, height = 1127.9126,
    resource_name = 'c01s03/c01s03_nubes_ventanas_ciudad.png',
    render_at_start = true,
  },
  
  c01s03_arboles_walk_behind = {
    layer_name = 'background',
    type = RESOURCE_TYPE_IMAGE,
    x = 1084.4465, y = 47.693237,
    width = 356.81311, height = 544.55914,
    resource_name = 'c01s03/c01s03_arboles_walk_behind.png',
    render_at_start = true,
  },
  
  c01s03_arboles_fondo = {
    layer_name = 'background',
    type = RESOURCE_TYPE_IMAGE,
    x = 4.2249713, y = -19.754196,
    width = 1915.775, height = 801.27295,
    resource_name = 'c01s03/c01s03_arboles_fondo.png',
    render_at_start = true,
  },
  
  c01s03_puestos_derecha = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 581.23248, y = 543.03894,
    width = 1336.2532, height = 708.83685,
    resource_name = 'c01s03/c01s03_puestos_derecha.png',
    render_at_start = true,
  },
  
  c01s03_lamp_2 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1761.8905, y = 600.26929,
    width = 120.69384, height = 682.01593,
    resource_name = 'c01s03/c01s03_lamp_2.png',
    render_at_start = true,
  },
  
  c01s03_paul_and_pete = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 808.64209, y = 373.20154,
    width = 260.54541, height = 366.87094,
    resource_name = 'c01s03/c01s03_paul_and_pete.png',
    render_at_start = true,
  },
  
  c01s03_foam_and_lather = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1027.3212, y = 539.23846,
    width = 363.99725, height = 414.76529,
    resource_name = 'c01s03/c01s03_foam_and_lather.png',
    render_at_start = true,
  },
  
  c01s03_paul_pete_shirt = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 965.21027, y = 647.28741,
    width = 51.246983, height = 62.262688,
    resource_name = 'c01s03/c01s03_paul_pete_shirt.png',
    render_at_start = true,
  },
  
  c01s03_canos = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 577, y = 262,
    width = 1341.0426, height = 1015.8398,
    resource_name = 'c01s03/c01s03_canos.png',
    render_at_start = true,
  },
  
  c01s03_cartel_klein = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1538.6486, y = 347.06104,
    width = 381.23926, height = 170.50398,
    resource_name = 'c01s03/c01s03_cartel_klein.png',
    render_at_start = true,
  },
  
  c01s03_foam_lather_cartel = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1048.199, y = 746.46069,
    width = 140.33054, height = 159.00934,
    resource_name = 'c01s03/c01s03_foam_lather_cartel.png',
    render_at_start = true,
  },
  
  c01s03_lamp_1 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1576.9878, y = 611.39075,
    width = 67.531075, height = 137.45686,
    resource_name = 'c01s03/c01s03_lamp_1.png',
    render_at_start = true,
  },
  
  c01s03_lamp_4 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1382.4697, y = 296.95917,
    width = 147.51469, height = 212.65103,
    resource_name = 'c01s03/c01s03_lamp_4.png',
    render_at_start = true,
  },
  
  c01s03_lamp_5 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1666.8104, y = 567.15289,
    width = 92.43615, height = 229.41406,
    resource_name = 'c01s03/c01s03_lamp_5.png',
    render_at_start = true,
  },
  
  c01s03_lamp_6 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1512.9382, y = 715.05786,
    width = 68.48896, height = 135.06215,
    resource_name = 'c01s03/c01s03_lamp_6.png',
    render_at_start = true,
  },
  
  c01s03_lamp_7 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1597.7002, y = 763.71075,
    width = 96.746643, height = 188.70384,
    resource_name = 'c01s03/c01s03_lamp_7.png',
    render_at_start = true,
  },
  
  c01s03_lamp_8 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1847.5704, y = 748.44897,
    width = 61.304802, height = 184.39336,
    resource_name = 'c01s03/c01s03_lamp_8.png',
    render_at_start = true,
  },
  
  c01s03_lamp_9 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1380.301, y = 631.11859,
    width = 101.53609, height = 182.95654,
    resource_name = 'c01s03/c01s03_lamp_9.png',
    render_at_start = true,
  },
  
  c01s03_lamp_9_lights2 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1417.1543, y = 644.32849,
    width = 70.404739, height = 164.27773,
    resource_name = 'c01s03/c01s03_lamp_9_lights2.png',
    render_at_start = true,
  },
  
  c01s03_lamparas_piso = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1302.4424, y = 940.06287,
    width = 443.50198, height = 284.97156,
    resource_name = 'c01s03/c01s03_lamparas_piso.png',
    render_at_start = true,
  },
  
  c01s03_lamp_3 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1686.5006, y = 765.30322,
    width = 120.21489, height = 216.48259,
    resource_name = 'c01s03/c01s03_lamp_3.png',
    render_at_start = true,
  },
  
  c01s03_lamp_piso_light1 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1337.979, y = 902.56799,
    width = 113.03074, height = 195.40906,
    resource_name = 'c01s03/c01s03_lamp_piso_light1.png',
    render_at_start = true,
  },
  
  c01s03_lamp_piso_light2 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1377.1368, y = 934.96844,
    width = 147.03574, height = 186.78807,
    resource_name = 'c01s03/c01s03_lamp_piso_light2.png',
    render_at_start = true,
  },
  
  c01s03_lamp_piso_light3 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1449.0769, y = 966.44995,
    width = 165.71454, height = 193.4933,
    resource_name = 'c01s03/c01s03_lamp_piso_light3.png',
    render_at_start = true,
  },
  
  c01s03_lamp_piso_light4 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1518.9784, y = 997.61395,
    width = 207.86159, height = 189.18279,
    resource_name = 'c01s03/c01s03_lamp_piso_light4.png',
    render_at_start = true,
  },
  
  c01s03_lamp_piso_light5 = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 1610.4519, y = 1034.7456,
    width = 216.48259, height = 161.40407,
    resource_name = 'c01s03/c01s03_lamp_piso_light5.png',
    render_at_start = true,
  },
  
  c01s03_paul_pete_cartel = {
    layer_name = 'objects',
    type = RESOURCE_TYPE_IMAGE,
    x = 801.97992, y = 719.4267,
    width = 124.52538, height = 137.93581,
    resource_name = 'c01s03/c01s03_paul_pete_cartel.png',
    render_at_start = true,
  },
  
  c01s03_puestos_walk_behind = {
    layer_name = 'walk_behind',
    type = RESOURCE_TYPE_IMAGE,
    x = 193.45911, y = 639.54614,
    width = 587.66406, height = 642.26355,
    resource_name = 'c01s03/c01s03_puestos_walk_behind.png',
    render_at_start = true,
  },
  
  c01s03_glasglow_walk_behind = {
    layer_name = 'walk_behind',
    type = RESOURCE_TYPE_IMAGE,
    x = 215.18027, y = 381.15891,
    width = 518.69617, height = 595.80603,
    resource_name = 'c01s03/c01s03_glasglow_walk_behind.png',
    render_at_start = true,
  },
  
  c01s03_canos_wb = {
    layer_name = 'walk_behind',
    type = RESOURCE_TYPE_IMAGE,
    x = 179.24855, y = 269.58167,
    width = 609.21649, height = 1014.4029,
    resource_name = 'c01s03/c01s03_canos_wb.png',
    render_at_start = true,
  },
  
  c01s03_glass_2 = {
    layer_name = 'walk_behind',
    type = RESOURCE_TYPE_IMAGE,
    x = 614.54651, y = 345.72873,
    width = 54.120647, height = 289.28204,
    resource_name = 'c01s03/c01s03_glass_2.png',
    render_at_start = true,
  },
  
  c01s03_glass_4 = {
    layer_name = 'walk_behind',
    type = RESOURCE_TYPE_IMAGE,
    x = 505.71448, y = 771.28253,
    width = 58.910088, height = 107.76235,
    resource_name = 'c01s03/c01s03_glass_4.png',
    render_at_start = true,
  },
  
  c01s03_glass_3 = {
    layer_name = 'walk_behind',
    type = RESOURCE_TYPE_IMAGE,
    x = 282.20706, y = 780.40399,
    width = 70.883682, height = 106.32552,
    resource_name = 'c01s03/c01s03_glass_3.png',
    render_at_start = true,
  },
  
  c01s03_glass_1 = {
    layer_name = 'walk_behind',
    type = RESOURCE_TYPE_IMAGE,
    x = 520.51678, y = 382.51624,
    width = 68.010017, height = 149.90939,
    resource_name = 'c01s03/c01s03_glass_1.png',
    render_at_start = true,
  },
  
}

c01s03:addObjects ( objects )

sounds = {
}

-- c01s03:addSounds( sounds )

function c01s03:beforeInitialize ()
  self:loadObjects ()
  self:loadSounds ()
  self:loadCharacter( mainCharacter )
  self.objects.main_character:setLoc(0, 0)
end

function c01s03:afterInitialize ()
end

local path = {
  behind_tree = {
    position = point (0, 0),
    neighbors = {},
    offsets = { x = 0, y = 0, scl = 1.0 }
  },
}

-- Walk path
c01s03:loadPath(path)
