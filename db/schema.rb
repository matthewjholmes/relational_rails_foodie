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

ActiveRecord::Schema.define(version: 2021_10_14_205447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.boolean "seasonal", default: false
    t.integer "calories"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "farmers_markets", force: :cascade do |t|
    t.string "name"
    t.boolean "local", default: true
    t.integer "vendor_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produces", force: :cascade do |t|
    t.string "name"
    t.boolean "seasonal", default: true
    t.integer "quantity"
    t.bigint "farmers_market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farmers_market_id"], name: "index_produces_on_farmers_market_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.boolean "dine_in", default: true
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "produces", "farmers_markets"
end
