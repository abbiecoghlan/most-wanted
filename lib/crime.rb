class Crime < ActiveRecord::Base
    belongs_to :city 
    belongs_to :fugitive

    #find all the crimes in a city
#     def self.find_by_city(location)
#         city = City.find_by(name: location.strip.downcase)
#         if city = nil
#         self.find_by(city_id: city.id)
#     end

# end