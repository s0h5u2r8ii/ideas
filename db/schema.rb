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

ActiveRecord::Schema.define(version: 2018_10_25_111706) do

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idea_comments", force: :cascade do |t|
    t.text "idea_comment"
    t.integer "user_id"
    t.integer "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idea_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_idea_favorites_on_idea_id"
    t.index ["user_id", "idea_id"], name: "index_idea_favorites_on_user_id_and_idea_id", unique: true
    t.index ["user_id"], name: "index_idea_favorites_on_user_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "idea_title"
    t.text "idea_text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "message_id"
    t.integer "message_notified_by_id"
    t.boolean "message_read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_notifications_on_message_id"
    t.index ["message_notified_by_id"], name: "index_message_notifications_on_message_notified_by_id"
    t.index ["user_id"], name: "index_message_notifications_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notified_by_id"
    t.integer "idea_id"
    t.integer "idea_favorite_id"
    t.integer "idea_comment_id"
    t.integer "work_id"
    t.integer "work_favorite_id"
    t.integer "work_comment_id"
    t.string "notified_type"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_comment_id"], name: "index_notifications_on_idea_comment_id"
    t.index ["idea_favorite_id"], name: "index_notifications_on_idea_favorite_id"
    t.index ["idea_id"], name: "index_notifications_on_idea_id"
    t.index ["notified_by_id"], name: "index_notifications_on_notified_by_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
    t.index ["work_comment_id"], name: "index_notifications_on_work_comment_id"
    t.index ["work_favorite_id"], name: "index_notifications_on_work_favorite_id"
    t.index ["work_id"], name: "index_notifications_on_work_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "deverope_flag", default: false
    t.string "user_name"
    t.string "name"
    t.string "name_phonetic"
    t.string "phone_number"
    t.string "profile_image_id"
    t.string "introduction"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_comments", force: :cascade do |t|
    t.text "work_comment"
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "work_title"
    t.text "work_text"
    t.integer "user_id"
    t.integer "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
