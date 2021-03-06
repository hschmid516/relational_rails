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

ActiveRecord::Schema.define(version: 2021_08_25_003917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.boolean "is_cold"
    t.integer "korok_seeds"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.index ["region_id"], name: "index_locations_on_region_id"
  end

  create_table "loots", force: :cascade do |t|
    t.string "name"
    t.boolean "memory"
    t.integer "armor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "world_boss_id"
    t.index ["world_boss_id"], name: "index_loots_on_world_boss_id"
  end

  create_table "regions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_divine_beast"
    t.integer "shrines"
    t.string "name"
  end

  create_table "world_bosses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "max_health"
    t.boolean "is_current_boss"
    t.string "zone"
  end

  add_foreign_key "locations", "regions"
  add_foreign_key "loots", "world_bosses"
end
