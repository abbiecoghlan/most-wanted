require 'httparty'

url = "https://api.fbi.gov/@wanted?pageSize=50&page=1&sort_on=modified&sort_order=desc"
response = HTTParty.get(url)
response.parsed_response


binding.pry
puts "hello"

#rake db:seed to run this file 