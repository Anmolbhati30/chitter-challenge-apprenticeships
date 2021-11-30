require "sinatra/base"
require "sinatra/reloader"
require "./lib/peep"

class Chitter < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get "/" do
    erb :index
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get "/add-peep" do
    # "hello"
    erb :"peeps/add"
  end
  run! if app_file == $0

  get "/rainbowbg.jpg" do
    send_file File.join(File.dirname(__FILE__), "public/images/rainbowbg.jpg")
  end
end
