package.path = package.path .. ";src/?.lua"

require 'math/point2d'
require 'path'
require 'resource_cache'
require 'defines'
require 'room'
require 'animatedProp'
require 'game'
         
require 'character'
require 'characters'
         
require 'hud/inventory'
require 'hud/highlight'
require 'hud/dialog'
require 'hud/hud'
         
require 'dialogTree'
         
require 'input_manager'
         
require 'rooms/c01s01'
require 'rooms/c01s02'

if DEBUG then
  require 'src/hud/debugHUD'
end
