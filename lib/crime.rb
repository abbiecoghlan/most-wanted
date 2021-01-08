class Crime < ActiveRecord::Base
    belongs_to :city 
    belongs_to :fugitive

    def print_data
        print "Subject: ".bold.blue
        puts "#{self.subject}"
        sleep(0.5)
        print "Description: ".bold.blue
        puts "#{self.description}"
        sleep(0.5)
        print "Suspects: ".bold.blue
        puts "#{self.fugitive.name}"
        sleep(0.5)
        print "Location: ".bold.blue 
        puts "#{self.city.name}" rescue
        sleep(0.5)
        print "Date recorded: ".bold.blue
        puts "#{self.created_at}"
        sleep(0.5)
        print "Reward: ".bold.blue
        puts "#{self.reward}"
        sleep(0.5)
        puts ""
    end

    def self.most_common_location
        crimes_with_city = Crime.select("city_id").where("city_id")
        city_ids = crimes_with_city.select {|crime| crime.city_id}
        sorted = city_ids.max_by {|id| city_ids.count(id)}
        location = City.find_by(id: sorted.city_id)
        location.name
    end 



end