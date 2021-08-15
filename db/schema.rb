# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_06_113019) do

  create_table "movies", force: :cascade do |t|
    t.string "name", limit: 160, null: false
    t.string "year", limit: 45
    t.text "description"
    t.string "image_url", limit: 150
    t.boolean "is_showing", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date", null: false
    t.integer "schedule_id", null: false
    t.integer "sheet_id", null: false
    t.string "email", limit: 255, null: false
    t.string "name", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_reservations_on_schedule_id"
    t.index ["sheet_id"], name: "index_reservations_on_sheet_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_schedules_on_movie_id"
  end

  create_table "sheets", force: :cascade do |t|
    t.integer "column", limit: 5, null: false
    t.string "row", limit: 1, null: false
  end

  add_foreign_key "reservations", "schedules"
  add_foreign_key "reservations", "sheets"
  add_foreign_key "schedules", "movies"
end
