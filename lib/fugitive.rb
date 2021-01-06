class Fugitive < ActiveRecord::Base
    has_many :crimes
    has_many :cities, through: :crimes

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


end