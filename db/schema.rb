# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 3) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crimes", force: :cascade do |t|
    t.integer "fugitive_id"
    t.integer "city_id"
    t.text "description"
    t.string "subject"
    t.text "reward"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fugitives", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.integer "age"
    t.string "hair_color"
    t.string "eye_color"
    t.boolean "at_large"
    t.string "gender"
    t.string "warning"
    t.string "scars_and_marks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
