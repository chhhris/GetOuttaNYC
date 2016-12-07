require 'rest-client'
require 'pp'

api_key = 'prtl6749387986743898559646983194'

params = {
  country: 'US',
  currency: 'USD',
  locale: 'en-US',
  locationSchema: 'iata',
  apikey: api_key,
  originplace: 'JFK-sky',
  destinationplace: 'STT-sky',
  outbounddate: '2016-12-16',
  inbounddate: '2016-12-19',
  adults: 1,
  children: 0,
  infants: 0,
  cabinclass: 'Economy'
}

api_response = RestClient.post("http://business.skyscanner.net/apiservices/pricing/v1.0/?apikey=#{api_key}", params, { Accept: 'application/json' })
polling_url = api_response.headers[:location]
flights_json_response = RestClient.get("#{polling_url}?apiKey=#{api_key}", { accept: :json })
flights = JSON.parse(flights_json_response)

# cheapest option
cheapest_flight = flights['Itineraries'].first
pp cheapest_flight

# price
flight_cost = cheapest_flight['PricingOptions'].first['Price']

# link to book it
booking_link = cheapest_flight['PricingOptions'].first['DeeplinkUrl']

# departure date
departure_date = '2016-12-16'

# return date
arrival_date = '2016-12-19'

# airport departure
origin_airport = 'JFK'

# airport arrival
destination_airport = 'STT'



routes = "http://partners.api.skyscanner.net/apiservices/browseroutes/v1.0/#{market}/#{currency}/#{locale}/#{originPlace}/#{destinationPlace}/#{outboundPartialDate}/#{inboundPartialDate}?apiKey=#{apiKey}"



{"OutboundLegId"=>"12712-1611041459--32171-1-16579-1611050831",
 "InboundLegId"=>"16579-1611061615--32171-1-12712-1611062230",
 "PricingOptions"=>
  [{"Agents"=>[2927891],
    "QuoteAgeInMinutes"=>39,
    "Price"=>505.8,
    "DeeplinkUrl"=>
     "http://partners.api.skyscanner.net/apiservices/deeplink/v2?_cje=l5a9YhdiSORpfQ4SVtD2QNzM9uMf8AymiAJCWfKC4bwJBUVlfJs5C1vgxHrHY%2fIt&url=http%3a%2f%2fwww.apideeplink.com%2ftransport_deeplink%2f4.0%2fUS%2fen-us%2fUSD%2fjfus%2f2%2f12712.16579.2016-11-04%2c16579.12712.2016-11-06%2fair%2ftrava%2fflights%3fitinerary%3dflight%7c-32171%7c703%7c12712%7c2016-11-04T14%3a59%7c16325%7c2016-11-04T19%3a02%3bflight%7c-32171%7c1236%7c16325%7c2016-11-05T07%3a56%7c16579%7c2016-11-05T08%3a31%2cflight%7c-32171%7c2035%7c16579%7c2016-11-06T16%3a15%7c16325%7c2016-11-06T16%3a56%3bflight%7c-32171%7c1904%7c16325%7c2016-11-06T19%3a35%7c12712%7c2016-11-06T22%3a30%26carriers%3d-32171%26passengers%3d1%26channel%3ddataapi%26cabin_class%3deconomy%26facilitated%3dfalse%26ticket_price%3d505.80%26is_npt%3dfalse%26is_multipart%3dfalse%26client_id%3dskyscanner_b2b%26request_id%3d466ab4f8-f537-42ee-9ee4-2af48fd6ace5%26deeplink_ids%3deu-west-1.prod_8131f97a67903d1b1c92aa94e0e9381c%26commercial_filters%3dfalse%26q_datetime_utc%3d2016-10-24T15%3a42%3a37"},
   {"Agents"=>[2407040],
    "QuoteAgeInMinutes"=>39,
    "Price"=>505.8,
    "DeeplinkUrl"=>
     "http://partners.api.skyscanner.net/apiservices/deeplink/v2?_cje=l5a9YhdiSORpfQ4SVtD2QNzM9uMf8AymiAJCWfKC4bwJBUVlfJs5C1vgxHrHY%2fIt&url=http%3a%2f%2fwww.apideeplink.com%2ftransport_deeplink%2f4.0%2fUS%2fen-us%2fUSD%2fetrp%2f2%2f12712.16579.2016-11-04%2c16579.12712.2016-11-06%2fair%2ftrava%2fflights%3fitinerary%3dflight%7c-32171%7c703%7c12712%7c2016-11-04T14%3a59%7c16325%7c2016-11-04T19%3a02%3bflight%7c-32171%7c1236%7c16325%7c2016-11-05T07%3a56%7c16579%7c2016-11-05T08%3a31%2cflight%7c-32171%7c2035%7c16579%7c2016-11-06T16%3a15%7c16325%7c2016-11-06T16%3a56%3bflight%7c-32171%7c1904%7c16325%7c2016-11-06T19%3a35%7c12712%7c2016-11-06T22%3a30%26carriers%3d-32171%26passengers%3d1%26channel%3ddataapi%26cabin_class%3deconomy%26facilitated%3dfalse%26ticket_price%3d505.80%26is_npt%3dfalse%26is_multipart%3dfalse%26client_id%3dskyscanner_b2b%26request_id%3d466ab4f8-f537-42ee-9ee4-2af48fd6ace5%26deeplink_ids%3deu-central-1.prod_d7bf8f662986b83c132319b05f585280%26commercial_filters%3dfalse%26q_datetime_utc%3d2016-10-24T15%3a42%3a32"},
   {"Agents"=>[2473844],
    "QuoteAgeInMinutes"=>39,
    "Price"=>546.26,
    "DeeplinkUrl"=>
     "http://partners.api.skyscanner.net/apiservices/deeplink/v2?_cje=l5a9YhdiSORpfQ4SVtD2QNzM9uMf8AymiAJCWfKC4bwJBUVlfJs5C1vgxHrHY%2fIt&url=http%3a%2f%2fwww.apideeplink.com%2ftransport_deeplink%2f4.0%2fUS%2fen-us%2fUSD%2ffard%2f2%2f12712.16579.2016-11-04%2c16579.12712.2016-11-06%2fair%2ftrava%2fflights%3fitinerary%3dflight%7c-32171%7c703%7c12712%7c2016-11-04T14%3a59%7c16325%7c2016-11-04T19%3a02%3bflight%7c-32171%7c1236%7c16325%7c2016-11-05T07%3a56%7c16579%7c2016-11-05T08%3a31%2cflight%7c-32171%7c2035%7c16579%7c2016-11-06T16%3a15%7c16325%7c2016-11-06T16%3a56%3bflight%7c-32171%7c1904%7c16325%7c2016-11-06T19%3a35%7c12712%7c2016-11-06T22%3a30%26carriers%3d-32171%26passengers%3d1%26channel%3ddataapi%26cabin_class%3deconomy%26facilitated%3dfalse%26ticket_price%3d546.26%26is_npt%3dfalse%26is_multipart%3dfalse%26client_id%3dskyscanner_b2b%26request_id%3d466ab4f8-f537-42ee-9ee4-2af48fd6ace5%26deeplink_ids%3deu-central-1.prod_96c585757b4ebf2dde103bbd695a69e0%26commercial_filters%3dfalse%26q_datetime_utc%3d2016-10-24T15%3a42%3a32"}],
 "BookingDetailsLink"=>
  {"Uri"=>
    "/apiservices/pricing/v1.0/3d14f564c5bd4a59a77dae7d605585eb_ecilpojl_A3863622FBFC4FE004AE23FE10E385C9/booking",
   "Body"=>
    "OutboundLegId=12712-1611041459--32171-1-16579-1611050831&InboundLegId=16579-1611061615--32171-1-12712-1611062230",
   "Method"=>"PUT"}
 }