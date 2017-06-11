require "./nekogirls-cr/*"
require "kemal"

Kemal.config.port = 8080
Kemal.config.public_folder = "./src/public/"

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
    # Be sure to check if file.filename is not empty otherwise it'll raise a compile time error
    if !filename.is_a?(String)
      env.response.status_code = 400
    else
      newfilename = unique_id + file_ext
      file_path = "./src/public/p/#{newfilename}"
      File.open(file_path, "w") do |f|
        IO.copy(file.tmpfile, f)
      end
      env.redirect "/p/#{newfilename}"
    end
  end

  error 403 do
    "Error with the filename"
  end

  Kemal.run
end
