require 'listen'

class FileWatcher
  attr_accessor :pid, :listener
  def parse

    rooms = all_files_on('room_definitions/')
    pbar = ProgressBar.new('Parsing rooms', rooms.size)
    rooms.each do |room_filename|
      # Parse room
      room = RoomParser.new(room_filename)
      result_filename = room_filename.gsub('room_definitions/', 'src/rooms/').gsub('.svg', '_definition.lua')
      f = File.open(result_filename, 'w')
      f.write(room.to_lua)
      f.close
      pbar.inc
    end
    puts ''


    dialogs = all_files_on('dialog_definitions/xml/')
    pbar = ProgressBar.new('Parsing dialogs', rooms.size)
    dialogs.each do |dialog_filename|
      # Parse room
      dialog = DialogParser.new(dialog_filename)
      result_filename = dialog_filename.gsub('dialog_definitions/xml/', 'src/dialogs/').gsub('.xml', '_dialogs.lua')
      f = File.open(result_filename, 'w')
      f.write(dialog.to_lua)
      f.close
      pbar.inc
    end
    puts ''
  end
  
  def start_game
    self.pid = spawn('moai main.lua')
  end

  def end_game
    Process.kill("HUP", self.pid)
  end

  def update_game
    self.end_game if self.pid
    self.parse
    self.start_game
  end
  
  def start
    self.update_game
    self.listener = Listen.to('./room_definitions', './src', './dialog_definitions/xml', :ignore => /definition/) do |modified, added, removed|
      puts "File changed"
      self.update_game
    end
  end

end