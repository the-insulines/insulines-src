require 'progressbar'
require 'fileutils'
require './tools/shared'
require './tools/room_parser'
require './tools/file_watcher'

listener = FileWatcher.new()
listener.start()