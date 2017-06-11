require "./nekogirls-cr/*"
require "kemal"
Kemal.config.port = 8080_i32


module Nekogirls
  # TODO Put your code here
  get "/" do
    "Hello World"
  end

  get "/upload" do
    render "src/views/form.ecr"
  end


  Kemal.run
end
