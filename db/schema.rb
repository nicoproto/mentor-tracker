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

ActiveRecord::Schema.define(version: 2021_12_10_154133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentorees", force: :cascade do |t|
    t.string "github_url"
    t.string "avatar_url"
    t.string "name"
    t.string "location"
    t.string "email"
    t.boolean "hireable"
    t.integer "public_repos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_mentorees", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "mentoree_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentoree_id"], name: "index_user_mentorees_on_mentoree_id"
    t.index ["user_id"], name: "index_user_mentorees_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "user_mentorees", "mentorees"
  add_foreign_key "user_mentorees", "users"
end
