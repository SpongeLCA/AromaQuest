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

ActiveRecord::Schema[7.1].define(version: 2024_07_18_065309) do
ActiveRecord::Schema[7.1].define(version: 2024_07_17_215950) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "perfume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfume_id"], name: "index_favorites_on_perfume_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "magasins", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "lat"
    t.float "long"
    t.string "photo"
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "perfume_id", null: false
    t.string "tete"
    t.string "coeur"
    t.string "fond"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfume_id"], name: "index_notes_on_perfume_id"
  end

  create_table "perfume_results", force: :cascade do |t|
    t.bigint "perfume_id", null: false
    t.bigint "result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfume_id"], name: "index_perfume_results_on_perfume_id"
    t.index ["result_id"], name: "index_perfume_results_on_result_id"
  end

  create_table "perfumes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "brand"
    t.decimal "price"
    t.string "photo"
    t.integer "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre"
    t.string "period"
    t.string "season"
    t.string "situations"
    t.string "smell"
  end

  create_table "results", force: :cascade do |t|
    t.integer "questionnaire_id"
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.string "answer_1"
    t.string "answer_2"
    t.string "answer_3"
    t.string "answer_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "answer_5"
    t.string "answer_6"
    t.string "answer_7"
    t.string "answer_8"
    t.string "answer_9"
    t.string "answer_10"
    t.integer "budget_min"
    t.integer "budget_max"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "perfume_id", null: false
    t.bigint "user_id", null: false
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perfume_id"], name: "index_reviews_on_perfume_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "address"
    t.float "lat"
    t.float "long"
    t.boolean "notifications"
    t.boolean "newsletter"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "perfumes"
  add_foreign_key "favorites", "users"
  add_foreign_key "notes", "perfumes"
  add_foreign_key "perfume_results", "perfumes"
  add_foreign_key "perfume_results", "results"
  add_foreign_key "results", "users"
  add_foreign_key "reviews", "perfumes"
  add_foreign_key "reviews", "users"
end
