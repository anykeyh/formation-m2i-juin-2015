require 'sinatra/reloader'

class Server < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  def render controller, action
    controller.new(params).print_out action
 end

  get "/search" do
    render IndexController, :search
  end

  get "/" do
    render IndexController, :index
  end
end