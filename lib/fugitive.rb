class Fugitive < ActiveRecord::Base
    has_many :crimes
    has_many :cities, through: :crimes
end