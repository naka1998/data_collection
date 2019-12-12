# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_11_080842) do

  create_table "elevators", force: :cascade do |t|
    t.integer "pin_id"
    t.string "description"
    t.integer "from", null: false
    t.integer "to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pin_id"], name: "index_elevators_on_pin_id"
  end

  create_table "pins", force: :cascade do |t|
    t.integer "station_id"
    t.integer "data_type", null: false
    t.float "lat", null: false
    t.float "lng", null: false
    t.integer "floor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_pins_on_station_id"
  end

  create_table "restrooms", force: :cascade do |t|
    t.integer "pin_id"
    t.string "description"
    t.boolean "is_multipurpose", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pin_id"], name: "index_restrooms_on_pin_id"
  end

  create_table "slopes", force: :cascade do |t|
    t.integer "pin_id"
    t.string "description"
    t.integer "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pin_id"], name: "index_slopes_on_pin_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer "pin_id"
    t.string "description"
    t.integer "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pin_id"], name: "index_steps_on_pin_id"
  end

end
