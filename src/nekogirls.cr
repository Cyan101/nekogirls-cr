require "kemal"
require "yaml"
require "dir"
require "./nekogirls-cr/*"

Config = YAML.parse(File.read("config.yaml"))

Kemal.config.port = Config["port"].as_s.to_i32
Kemal.config.public_folder = "./public/"
Kemal.config.host_binding = "localhost"

module Nekogirls
  save_folder = Config["save_folder"].as_s
  banned_ext = Config["banned_ext"].as_a

  get "/" do
    "Hello World"
  end

  get "/upload" do
    render "src/views/form.ecr"
  end

  post "/upload" do |env|
    file = env.params.files["file_to_upload"]
    filename = file.filename.as(String)
    env.response.status_code = 406 if file_ext = File.extname(filename)
    next if banned_ext.includes?(file_ext)
      newfilename = unique_id + file_ext
      file_path = "./public/#{save_folder}/#{newfilename}"
      File.open(file_path, "w") do |f|
        IO.copy(file.tmpfile, f)
      end
      env.redirect "/#{save_folder}/#{newfilename}"
  end

  error 406 do
    "Filetype is banned"
  end

  puts "Booting! Vers." + VERSION
  Kemal.run
end
