def all_files_on(dir, files = [])
  if File.directory?(dir)
    Dir.foreach(dir) do |file|
      if !['.', '..', '.DS_Store', '.gitignore', '.git' ].include?(file)
        if File.directory?(dir + file)
          all_files_on(dir + file + '/', files)
        else
          files << "#{dir}#{file}"
        end
      end
    end
  end
  files
end
