require 'progressbar'
require 'fileutils'
require './tools/shared'
require './tools/room_parser'
require './tools/room_definitions_listener'

listener = RoomDefinitionsListener.new()
listener.start()