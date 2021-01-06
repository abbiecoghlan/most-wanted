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

    def self.oldest_fugitive
        self.select {|fugitive| fugitive.age != nil}.max_by {|fugitive| fugitive.age}
    end

    def self.youngest_fugitive
        self.select {|fugitive| fugitive.age != nil}.min_by {|fugitive| fugitive.age}
    end

    def self.most_common_hair_color
        hair_colors = self.select {|fugitive| fugitive.hair_color}
        sorted = hair_colors.max_by {|color| hair_colors.count(color)}
        sorted.hair_color
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

    def print_table
        table = TTY:Table.new([""])
    end 

    def print_data
        puts "Name: #{self.name}"
        puts "Aliases: #{self.alias}"
        puts "Age: #{self.age}"
        puts "Hair color: #{self.hair_color}"
        puts "Eye color: #{self.eye_color}"
        puts "Gender: #{self.gender}"
        puts "Scars and marks: #{self.scars_and_marks}"
        if self.at_large
            puts "Status: Suspect is at large"
            puts "Warning: #{self.warning}"
        else
            puts "Status: Captured" 
        end 
    end

end