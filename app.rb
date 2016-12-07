  require 'sinatra'
require 'sinatra/base'
require 'ostruct'

class App < Sinatra::Base

  helpers do
    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['wat', 'wat']
    end
  end

  set :title, 'getoutta.nyc'

  get '/' do
    title = 'getoutta.nyc'
    erb :index
  end

  get '/admin' do
    protected!
    erb :admin
  end

  get '/about' do
    erb :about
  end

  get '/contact' do
    erb :contact
  end
end

# docker build -t docker-sinatra .
# docker run -p 4000:80 docker-sinatra

# docker build -t docker-sinatra . && docker run -p 4000:80 docker-sinatra