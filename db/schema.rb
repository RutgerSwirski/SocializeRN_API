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

ActiveRecord::Schema.define(version: 2019_11_09_001439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invites", force: :cascade do |t|
    t.string "date_time"
    t.string "location"
    t.string "status"
    t.bigint "sender_id"
    t.bigint "reciever_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reciever_id"], name: "index_invites_on_reciever_id"
    t.index ["sender_id"], name: "index_invites_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "profile_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "first_login", default: true
    t.float "longitude", default: 0.0
    t.float "latitude", default: 0.0
    t.string "notification_token"
  end

  add_foreign_key "invites", "users", column: "reciever_id"
  add_foreign_key "invites", "users", column: "sender_id"
end
