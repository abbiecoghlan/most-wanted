class Crime < ActiveRecord::Base
    belongs_to :city 
    belongs_to :fugitive

    def print_data
        puts "Subject: #{self.subject}"
        sleep(0.5)
        puts "Description: #{self.description}"
        sleep(0.5)
        puts "Suspects: #{self.fugitive.name}"
        sleep(0.5)
        puts "Location: #{self.city.name}" rescue
        sleep(0.5)
        puts "Date recorded: #{self.created_at}"
        sleep(0.5)
        puts "Reward: #{self.reward}"
        puts ""
    end

    def self.most_common_location
        crimes_with_city = Crime.select("city_id").where("city_id")
        city_ids = crimes_with_city.select {|crime| crime.city_id}
        sorted = city_ids.max_by {|id| city_ids.count(id)}
        location = City.find_by(id: sorted.city_id)
        location.name
    end 


    #find all the crimes in a city
#     def self.find_by_city(location)
#         city = City.find_by(name: location.strip.downcase)
#         if city = nil
#         self.find_by(city_id: city.id)
#     end




end