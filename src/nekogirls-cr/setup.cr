macro gets_scalar(value)
  yaml.scalar "{{value}}"
  puts "Enter {{value}}:"
  yaml.scalar gets.not_nil!.chomp
end

macro scalar_mkdir(value)
  yaml.scalar "{{value}}"
  puts "Enter {{value}}:"
  folder = gets.not_nil!.chomp
  Dir.mkdir("src/public/#{folder}") unless Dir.exists?("src/public/#{folder}")
  yaml.scalar folder
end

unless File.exists?("config.yaml")
  puts "No config found, creating config.yaml"
  yaml = YAML.build do |yaml|
    yaml.mapping do
      gets_scalar port
      scalar_mkdir save_folder
      yaml.scalar "banned_ext"
      yaml.sequence do
        %w(.exe .msi .swf .html .scr .cpl).each do |x|
          yaml.scalar x
        end
      end
    end
  end

  File.write("config.yaml", yaml)
end
