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
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['bqvc', 'bqvc']
    end

    def featured_trip
      # flight = Redis.get('featured_flight')
      # flight = ITINERARIES[params[:airport_code].to_sym]
      flight_code = params[:code] || 'pos'
      flight = Itineraries.get(flight_code)
      OpenStruct.new(flight)
    end

    # def itineraries

    # end
  end

  set :title, 'getoutof.nyc'

  get '/' do
    @featured_trip = featured_trip
    erb :index
  end

  get '/oj' do
    protected!
    erb :oj
  end

  get '/about' do
    erb :about
  end

  get '/contact' do
    erb :contact
  end

  class Itineraries
    TRIPS = {
      stt: {
        code: 'stt',
        destination: 'Saint Thomas',
        temperature: 84,
        price: 375,
        departure_month: 'February',
        departure_day: 2,
        arrival_day: 5,
        url: 'http://bit.ly/2hexMC4'
      },
      cun: {
        code: 'cun',
        destination: 'Tulum',
        temperature: 75,
        price: 280,
        departure_month: 'January',
        departure_day: 20,
        arrival_day: 23,
        url: 'http://bit.ly/2hexFXa'
      },
      pos: {
        code: 'pos',
        destination: 'Port of Spain',
        temperature: 86,
        price: 350,
        departure_month: 'February',
        departure_day: 2,
        arrival_day: 5,
        url: 'http://bit.ly/2heGKir'
      }
    }

    def self.get(code)
      TRIPS[code.to_sym]
    end
  end

end

# docker build -t docker-sinatra .
# docker run -p 4000:80 docker-sinatra

# docker build -t docker-sinatra . && docker run -p 4000:80 docker-sinatra

# sinatra server
# bundle exec rackup -p 4000