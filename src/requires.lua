package.path = package.path .. ";src/?.lua"

require 'math/point2d'
require 'path'
require 'resource_cache'
require 'defines'
require 'state_manager'
require 'room'
require 'animatedProp'
require 'loadingScreen'
require 'game'

require 'character'
require 'characters'

require 'hud/inventory'
require 'hud/highlight'
require 'hud/dialog'
require 'hud/map'
require 'hud/cellphone'
require 'hud/hud'

-- require 'dialogTree'

require 'input_manager'

require 'rooms/mainScreen'
require 'rooms/thankYouScreen'
require 'rooms/c01s01'
require 'rooms/c01s02'
require 'rooms/c01s03'
require 'rooms/c01s04'
require 'rooms/map'

if DEBUG then
  require 'src/hud/debugHUD'
end
