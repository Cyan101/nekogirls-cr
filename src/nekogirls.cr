require "./nekogirls-cr/*"
require "kemal"

Kemal.config.port = 8080
Kemal.config.public_folder = "./src/public/"
Kemal.config.host_binding = "localhost"

module Nekogirls
  get "/" do
    "Hello World"
  end

  get "/upload" do
    render "src/views/form.ecr"
  end

  post "/upload" do |env|
    file = env.params.files["file_to_upload"]
    filename = file.filename.as(String)
    file_ext = File.extname(filename)
      newfilename = unique_id + file_ext
      file_path = "./src/public/p/#{newfilename}"
      File.open(file_path, "w") do |f|
        IO.copy(file.tmpfile, f)
      end
      env.redirect "/p/#{newfilename}"
  end

  error 403 do
    "Error with the filename"
  end

  Kemal.run
end
