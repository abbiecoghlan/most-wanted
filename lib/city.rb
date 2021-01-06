class City < ActiveRecord::Base
    has_many :crimes
    has_many :fugitives, through: :crimes

def user_input
    gets.chomp
end


end