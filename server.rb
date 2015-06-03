class Server < Sinatra::Base
  get "/" do
    IndexController.new.index
  end
end