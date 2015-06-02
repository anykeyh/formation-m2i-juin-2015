class Server < Sinatra::Base
  self.get("/") do
    "hello world"
  end
end