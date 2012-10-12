require './shared'
require "fileutils"
require "progressbar"
require "rmagick"

files = all_files_on(ARGV[0])

delete = []
frames = []

# pbar = ProgressBar.new('Images', files.size)

same = 1
last_frame_n = 1
last_frame_image = nil
last_frame_file = nil

files.sort_by!{ |f| f.match(/\d+/)[0].to_i }

files.each_with_index do |file, i|
  
  # update first image
  if same == 1
    last_frame_file = file.clone
    last_frame_image = Magick::Image.read(file).first
    last_frame_n = i
  end
  
  if i+1 < files.size
    image2 = Magick::Image.read(files[i+1]).first
    if last_frame_image == image2
      delete << [ files[i+1], same ]
      same += 1
    else
      frames << [ last_frame_file, last_frame_n, same ]
      last_frame_image.destroy!
      same = 1
    end
    
    image2.destroy!
  else
    frames << [ last_frame_file, last_frame_n, same ]
    last_frame_image.destroy!
  end
  
  # pbar.inc
end


# rename all files to avoid name collisions
files.each do |file|
  new_file = file + ".tmp"
  FileUtils.mv file, new_file
end


delete.each do |frame|
  tmp_frame = frame[0] + ".tmp"
  FileUtils.rm(tmp_frame)
end


frame_definition = ""

frames.each_with_index do |frame, i|
  frame_index = i+1
  frame_definition += "{frame = #{frame_index}, times = #{frame[2]}},\n"
  
  tmp_name = frame[0] + ".tmp"
  split_file_name = frame[0].split(/\d+/)
  new_name = split_file_name[0] + frame_index.to_s + split_file_name[1]
  FileUtils.mv tmp_name, new_name
end


puts frame_definition


