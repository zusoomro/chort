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

ActiveRecord::Schema.define(version: 2020_12_31_202115) do

  create_table "chores", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "home_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["home_id"], name: "index_chores_on_home_id"
    t.index ["user_id"], name: "index_chores_on_user_id"
  end

  create_table "chores_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chore_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chore_id"], name: "index_chores_users_on_chore_id"
    t.index ["user_id"], name: "index_chores_users_on_user_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "homes_users", force: :cascade do |t|
    t.integer "home_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["home_id"], name: "index_homes_users_on_home_id"
    t.index ["user_id"], name: "index_homes_users_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "home_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["home_id"], name: "index_members_on_home_id"
    t.index ["user_id"], name: "index_members_on_user_id"
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

  add_foreign_key "chores", "homes"
  add_foreign_key "chores", "users"
  add_foreign_key "chores_users", "chores"
  add_foreign_key "chores_users", "users"
  add_foreign_key "homes_users", "homes"
  add_foreign_key "homes_users", "users"
  add_foreign_key "members", "homes"
  add_foreign_key "members", "users"
end
