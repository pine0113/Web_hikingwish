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

ActiveRecord::Schema.define(version: 20180907015815) do

  create_table "hikings", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "level"
    t.integer "day"
    t.integer "miles"
    t.text "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_member_applies", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "user_id"
    t.boolean "accept"
    t.boolean "notified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_members", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_owner_invites", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "user_id"
    t.boolean "accept"
    t.boolean "notified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.date "start_date"
    t.date "end_date"
    t.integer "budget_bottom"
    t.integer "budget_top"
    t.integer "budget_final"
    t.integer "level"
    t.integer "day"
    t.integer "miles"
    t.text "intro"
    t.integer "join_count"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "role", default: "normal", null: false
    t.string "tel"
    t.text "intro"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wish_hikings", force: :cascade do |t|
    t.integer "wish_id"
    t.integer "hiking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "budget_bottom"
    t.integer "budget_top"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
