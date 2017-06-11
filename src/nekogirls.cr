require "./nekogirls-cr/*"
require "kemal"


module Nekogirls
  # TODO Put your code here
  get "/" do
    "Hello World"
  end

  Kemal.run
end
