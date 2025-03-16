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

ActiveRecord::Schema[7.0].define(version: 2025_03_03_121731) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "personalities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_personalities_on_name", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.datetime "broadcast_date"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["program_id"], name: "index_posts_on_program_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "program_personalities", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "personality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personality_id"], name: "index_program_personalities_on_personality_id"
    t.index ["program_id", "personality_id"], name: "index_program_personalities_on_program_id_and_personality_id", unique: true
    t.index ["program_id"], name: "index_program_personalities_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title", null: false
    t.string "channel"
    t.string "day", null: false
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "personality_name"
    t.bigint "user_id"
    t.index ["title", "channel"], name: "index_programs_on_title_and_channel", unique: true
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "posts", "programs"
  add_foreign_key "posts", "users"
  add_foreign_key "program_personalities", "personalities"
  add_foreign_key "program_personalities", "programs"
  add_foreign_key "programs", "users"
end
