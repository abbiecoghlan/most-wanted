class CreateFugitives < ActiveRecord::Migration[4.2]
    def change
        create_table :fugitives do |t|
            t.string :name
            t.string :alias
            t.integer :age
            t.string :hair_color
            t.string :eye_color
            t.boolean :at_large
            t.string :gender
            t.string :warning
        end
    end
end