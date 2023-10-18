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

ActiveRecord::Schema[7.0].define(version: 2023_10_18_170420) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinema_hall_screens", force: :cascade do |t|
    t.bigint "cinema_hall_id", null: false
    t.bigint "screen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_hall_id"], name: "index_cinema_hall_screens_on_cinema_hall_id"
    t.index ["screen_id"], name: "index_cinema_hall_screens_on_screen_id"
  end

  create_table "cinema_halls", force: :cascade do |t|
    t.string "name"
    t.integer "total_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
  end

  create_table "cinema_seats", force: :cascade do |t|
    t.string "row"
    t.integer "number"
    t.bigint "cinema_hall_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "show_id"
    t.integer "screen_id"
    t.index ["cinema_hall_id"], name: "index_cinema_seats_on_cinema_hall_id"
  end

  create_table "cities", force: :cascade do |t|
    t.integer "pincode"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_movies", force: :cascade do |t|
    t.integer "city_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crews", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "image_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hall_movie_shows", force: :cascade do |t|
    t.integer "cinema_hall_id"
    t.integer "movie_id"
    t.integer "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "screen_id"
    t.integer "city_id"
  end

  create_table "movie_crews", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "crew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screens", force: :cascade do |t|
    t.string "name"
    t.boolean "three_d"
    t.boolean "two_d"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cinema_hall_id"
  end

  create_table "show_seats", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.bigint "cinema_seat_id", null: false
    t.boolean "booked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_seat_id"], name: "index_show_seats_on_cinema_seat_id"
    t.index ["show_id"], name: "index_show_seats_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.date "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cinema_hall_screens", "cinema_halls"
  add_foreign_key "cinema_hall_screens", "screens"
  add_foreign_key "cinema_seats", "shows", column: "cinema_hall_id"
  add_foreign_key "show_seats", "cinema_seats"
  add_foreign_key "show_seats", "shows"
end
