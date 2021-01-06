class Fugitive < ActiveRecord::Base
    has_many :crimes
    has_many :cities, through: :crimes

    def user_input
        gets.chomp
    end
   
    def self.average_age
        ages = self.select {|fugitive| fugitive.age != nil}.collect {|fugitive| fugitive.age}
        ages.sum / ages.count
    end

    def self.oldest_criminal
        self.select {|fugitive| fugitive.age != nil}.max_by {|fugitive| fugitive.age}
    end

    def self.youngest_criminal
        self.select {|fugitive| fugitive.age != nil}.min_by {|fugitive| fugitive.age}
    end

    # def self.most_common_hair_color
    #     hair_colors = self.select {|fugitive| fugitive.hair_color}
    #     hair_colors.max_by {|color| hair_colors.count(color)}
    # end 

    
    # def self.find_by_city(location)
    #     self.crimes.find_by()
        
    #     Crime.all.select{|c| c.find_by == user_input.split.downcase}
    # end

    #find all the fugitives in a city
    # def self.find_by_city(location)
    #     city = City.find_by(name: location.strip.downcase)
    #     Fugitive.crimes.find_by(city_id: city.id)
    # end


    def print_data
        puts "Fugitive name: #{self.name}"
        puts "Known aliases: #{self.alias}"
        puts "Age: #{self.age}"

    end

end