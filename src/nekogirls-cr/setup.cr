macro gets_scalar(value)
  yaml.scalar "{{value}}"
  puts "Enter {{value}}:"
  yaml.scalar gets.not_nil!.chomp
end

unless File.exists?("config.yaml")
  puts "No config found, creating config.yaml"
  yaml = YAML.build do |yaml|
    yaml.mapping do
      gets_scalar port
      gets_scalar save_folder
      yaml.scalar "banned_ext"
      yaml.sequence do
        %w(.exe .msi .swf .html .scr .cpl).each do |x|
          yaml.scalar x
        end
      end
    end
  end

  folder = YAML.parse(yaml)["save_folder"]
  Dir.mkdir("./public") unless Dir.exists?("./public")
  Dir.mkdir("./public/#{folder}") unless Dir.exists?("./public/#{folder}")

  File.write("config.yaml", yaml)
end
