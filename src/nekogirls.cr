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


  Kemal.run
end
