curl -X POST http://business.skyscanner.net/apiservices/pricing/v1.0/?apikey=prtl6749387986743898559646983194 \
-H "Content-Type:application/json" \
-F 'country=USA' \
-F 'currency=USD' \
-F 'locale=en-US' \
-F 'originplace=JFK-sky' \
-F 'destinationplace=STT-sky' \
-F 'outbounddate=2016-11-04' \
-F 'inbounddate=2016-11-06' \
-F 'locationSchema=iata' \
-F 'adults=1' \
-F 'cabinclass=Economy'

# key?
apiKey=ve518156965014636303894819187830
apiKey=prtl6749387986743898559646983194


curl -v -X POST "http://business.skyscanner.net/apiservices/pricing/v1.0/" -F apikey=prtl6749387986743898559646983194 \
-H "Content-Type:application/x-www-form-urlencoded; charset=UTF-8" \
-H "Content-Length:2" \
-F 'country=USA' \
-F 'currency=USD' \
-F 'locale=en-US' \
-F 'originplace=JFK-sky' \
-F 'destinationplace=STT-sky' \
-F 'outbounddate=2016-11-04' \
-F 'inbounddate=2016-11-06' \
-F 'locationSchema=iata' \
-F 'adults=1' \
-F 'children=0' \
-F 'infants=0' \
-F 'cabinclass=Economy'

curl -v -X POST http://business.skyscanner.net/apiservices/pricing/v1.0/?apikey=prtl6749387986743898559646983194 -H "Content-Length:2"

curl -v -X POST http://business.skyscanner.net/apiservices/pricing/v1.0/?apiKey=prtl6749387986743898559646983194 \
-H "Accept:application/json" \
-H "Content-Length:2" \
-F "country=US" \
-F "currency=USD" \
-F "locale=en-US" \
-F "originplace=JFK-sky" \
-F "destinationplace=STT-sky" \
-F "outbounddate=2016-11-04" \
-F "inbounddate=2016-11-06" \
-F "locationSchema=iata" \
-F "adults=1" \
-F "children=0" \
-F "infants=0" \
-F "cabinclass=Economy"


curl -v -X GET -G \
http://business.skyscanner.net/apiservices/pricing/uk2/v1.0/80c0efe89b7f4796bca7e4512eddf3cb_ecilpojl_B3DF0ACF5279FB4028DC5FA856FC2F3A \
-d apiKey=prtl6749387986743898559646983194

curl -X DELETE -G \
'http://localhost:5000/locations' \
-d id=3 \
-d name=Mario \
-d surname=Bros


curl -v -X POST http://business.skyscanner.net/apiservices/pricing/v1.0/?apikey=ve518156965014636303894819187830 \
-H Accept:application/json \
-H Content-Length:2 \
-F country=US \
-F currency=USD \
-F locale=en-US \
-F locationSchema=iata \
-F apiKey=ve518156965014636303894819187830 \
-F originplace=JFK-sky \
-F destinationplace=STT-sky \
-F outbounddate=2016-11-10 \
-F inbounddate=2016-11-13 \
-F adults=1 \
-F children=0 \
-F infants=0 \
-F cabinclass=Economy

curl -v -X GET http://partners.api.skyscanner.net/apiservices/reference/v1.0/currencies?apiKey=ve518156965014636303894819187830

RestClient.post("http://business.skyscanner.net/apiservices/pricing/v1.0/?apikey=ve518156965014636303894819187830", params, headers)
params = "country=US&currency=USD&locale=en-US&originplace=JFK-sky&destinationplace=STT-sky&outbounddate=2016-11-04&inbounddate=2016-11-06&locationSchema=iata&adults=1&children=0&infants=0&cabinclass=Economy"

curl -v -X POST http://business.skyscanner.net/apiservices/pricing/v1.0/?apikey=ve518156965014636303894819187830 \
-H "Accept:application/json" \
-d "country=US&currency=USD&locale=en-US&originplace=JFK-sky&destinationplace=STT-sky&outbounddate=2016-11-04&inbounddate=2016-11-06&locationSchema=iata&adults=1&children=0&infants=0&cabinclass=Economy"