class Crime < ActiveRecord::Base
    belongs_to :city 
    belongs_to :fugitive

    def print_data
        puts "Subject: #{self.subject}"
        puts "Description: #{self.description}"
        puts "Suspects: #{self.fugitive.name}"
        puts "Location: #{self.city.name}"
        puts "Date recorded: #{self.created_at}"
        puts "Reward: #{self.reward}"
    end

    # def fugitives
    #     Fugitive.find_by(id: self.fugitive_id)
    # end 

    # def cities
    #     City.find_by(id: self.city_id)
    # end


    #find all the crimes in a city
#     def self.find_by_city(location)
#         city = City.find_by(name: location.strip.downcase)
#         if city = nil
#         self.find_by(city_id: city.id)
#     end




end