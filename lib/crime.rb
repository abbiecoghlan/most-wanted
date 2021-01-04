class Crime < ActiveRecord::Base
    belongs_to :city 
    belongs_to :fugitive
end