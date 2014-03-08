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

ActiveRecord::Schema.define(version: 20140308182956) do

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercises", ["user_id", "name"], name: "index_exercises_on_user_id_and_name"

  create_table "groups", force: true do |t|
    t.integer  "wod_prototype_id"
    t.integer  "wod_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["wod_prototype_id", "wod_id", "name", "position"], name: "group_index", unique: true

  create_table "reps", force: true do |t|
    t.integer  "sett_id"
    t.integer  "exercise_id"
    t.decimal  "resistance"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reps", ["sett_id", "exercise_id", "position"], name: "index_reps_on_sett_id_and_exercise_id_and_position"

  create_table "setts", force: true do |t|
    t.integer  "group_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "setts", ["group_id", "position"], name: "index_setts_on_group_id_and_position"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wod_prototypes", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wod_prototypes", ["user_id", "name"], name: "index_wod_prototypes_on_user_id_and_name"

  create_table "wods", force: true do |t|
    t.integer  "user_id"
    t.integer  "wod_prototype_id"
    t.string   "name"
    t.datetime "time"
  end

  add_index "wods", ["user_id", "wod_prototype_id", "name", "time"], name: "wod_index", unique: true

end
