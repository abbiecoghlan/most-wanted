class Fugitive < ActiveRecord::Base
    has_many :crimes
    has_many :cities, through: :crimes

    def user_input
        gets.chomp
    end
   
    # def self.find_by_city(location)
    #     self.crimes.find_by()
        
    #     Crime.all.select{|c| c.find_by == user_input.split.downcase}
    # end

    #find all the fugitives in a city
    # def self.find_by_city(location)
    #     city = City.find_by(name: location.strip.downcase)
    #     Fugitive.crimes.find_by(city_id: city.id)
    # end



end