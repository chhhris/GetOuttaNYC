require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
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
