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

ActiveRecord::Schema.define(version: 2022_05_12_201126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dungeon_masters", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_players"
    t.boolean "dm_active"
    t.string "level_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_characters", force: :cascade do |t|
    t.string "player_name"
    t.string "character_name"
    t.integer "age"
    t.integer "character_level"
    t.boolean "is_alive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dungeon_master_id"
    t.string "character_class"
    t.string "character_race"
    t.index ["dungeon_master_id"], name: "index_player_characters_on_dungeon_master_id"
  end

  add_foreign_key "player_characters", "dungeon_masters"
end
