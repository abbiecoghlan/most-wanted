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
  

    def print_data
        print "Name: ".bold.blue
        puts "#{self.name}"
        sleep(0.5)
        print "Aliases: ".bold.blue
        puts "#{self.alias}"
        sleep(0.5)
        print "Age: ".bold.blue
        puts "#{self.age}"
        sleep(0.5)
        print "Hair color: ".bold.blue
        puts "#{self.hair_color}"
        sleep(0.5)
        print "Eye color: ".bold.blue
        puts "#{self.eye_color}"
        sleep(0.5)
        print "Gender: ".bold.blue
        puts "#{self.gender}"
        sleep(0.5)
        print "Scars and marks: ".bold.blue
        puts "#{self.scars_and_marks}"
        sleep(0.5)

        if self.at_large == true
            print "Status: ".bold.blue
            puts "Suspect is at large"
            sleep(0.5)
            print "Warning: ".bold.blue
            puts "#{self.warning}"
        else
            print "Status: ".bold.blue
            puts "Captured" 
        end 
    end

end