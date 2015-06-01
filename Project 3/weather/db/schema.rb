# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150530043410) do

  create_table "days", force: :cascade do |t|
    t.date     "datestamp"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "days", ["location_id"], name: "index_days_on_location_id"

  create_table "locations", force: :cascade do |t|
    t.integer  "postcode"
    t.float    "lat"
    t.float    "lon"
    t.string   "loc_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["loc_id"], name: "index_locations_on_loc_id"

  create_table "readings", force: :cascade do |t|
    t.time     "timestamp"
    t.float    "rainfall"
    t.float    "temp"
    t.float    "windspeed"
    t.string   "winddirection"
    t.integer  "day_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "readings", ["day_id"], name: "index_readings_on_day_id"

end
