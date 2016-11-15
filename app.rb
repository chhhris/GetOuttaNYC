require 'sinatra'
require 'sinatra/base'
require 'ostruct'

class App < Sinatra::Base
  set :title, 'getoutta.nyc'

  get '/' do
    title = 'getoutta.nyc'
    erb :index
  end

  get '/admin' do
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