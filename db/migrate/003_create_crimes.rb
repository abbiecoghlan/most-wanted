class CreateCrimes < ActiveRecord::Migration[4.2]
    def change
        create_table :crimes do |t|
            t.integer :fugative_id
            t.integer :city_id
            t.text :description
            t.string :subject
        end
    end
end