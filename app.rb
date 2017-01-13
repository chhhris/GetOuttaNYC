require 'sinatra'
require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'ostruct'
require "#{Dir.pwd}/models/trip.rb"

class App < Sinatra::Base
  DESTINATION_NAMES = {
    stt: 'Saint Thomas',
    cun: 'Tulum',
    pos: 'Port of Spain'
  }

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
  end

  get '/' do
    @featured_trip = Trip.where(featured: true).first || Trip.last
    @destination = DESTINATION_NAMES[@featured_trip.destination_code.downcase.to_sym]

    erb :index
  end

  get '/oj' do
    protected!

    if Trip.where(featured: true).blank?
      Trip.last.update_column(:featured, true)
    end

    @trips = Trip.all.order(price: :asc)

    erb :oj
  end

  get '/about' do
    erb :about
  end

  get '/contact' do
    erb :contact
  end

  post '/select_trip' do
    old_featured_trip = Trip.where(featured: true).first
    new_featured_trip = Trip.find(params[:id])

    if new_featured_trip.present?
      new_featured_trip.featured = true
      new_featured_trip.save

      old_featured_trip.featured = false
      old_featured_trip.save
    end

    redirect '/oj'
  end

  post '/refresh_flights' do
    Trip.generate_flights
    redirect '/oj'
  end


end

# Docker build image and run server
# $ docker build -t docker-sinatra . && docker run -p 4000:80 docker-sinatra

# Rack server only (ex-Docker)
# $ bundle exec rackup -p 4000
