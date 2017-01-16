require 'sinatra/activerecord'
require 'rest-client'

class Trip  < ActiveRecord::Base

  class << self

    # add to env
    API_KEY = 've518156965014636303894819187830'
    DESTINATIONS = %w(STT CUN POS)
    PARAMS = {
      country: 'US',
      currency: 'USD',
      locale: 'en-US',
      locationSchema: 'iata',
      apikey: API_KEY,
      originplace: 'JFK-sky',
      adults: 1,
      children: 0,
      infants: 0,
      cabinclass: 'Economy'
    }

    def generate_flights
      first_departure_date = Date.parse('Friday') + 14.days
      departure_dates = [ first_departure_date, first_departure_date + 14.days, first_departure_date + 28.days ]

      departure_dates.each do |departure_date|
        return_date = departure_date + 3.days

        DESTINATIONS.each do |destination_code|
          search_api(destination_code, departure_date, return_date)
        end
      end

    end

    def search_api(destination_code, departure_date, return_date)
      params = PARAMS.merge( destinationplace: destination_code, outbounddate: departure_date,
          inbounddate: return_date)

      post_url = "http://business.skyscanner.net/apiservices/pricing/v1.0/?apikey=#{API_KEY}"

      RestClient.post(post_url, params, { Accept: 'application/json' }) do |response, request, result, &block|
        if response.code == 201
          polling_url = response.headers[:location]
          poll_response_and_save(polling_url, destination_code, departure_date, return_date)
        end
      end
    end

    def poll_response_and_save(polling_url, destination_code, departure_date, return_date)
      RestClient.get("#{polling_url}?apiKey=#{API_KEY}", { accept: :json }) do |response, request, result, &block|
        return unless response.code == 200

        cheapest_flight = JSON.parse(response)['Itineraries'].first

        # price
        flight_cost = cheapest_flight['PricingOptions'].first['Price']

        # link to book it
        booking_link = cheapest_flight['PricingOptions'].first['DeeplinkUrl']

        trip = Trip.new(destination_code: destination_code, departure: departure_date, return: return_date,
            price: flight_cost, url: booking_link, featured: false)

        trip.save
      end
    end

  end
end