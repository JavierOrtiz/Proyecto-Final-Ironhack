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

ActiveRecord::Schema.define(version: 20150525125401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "assignation_date"
    t.datetime "assignation_end_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "assignations", ["event_id"], name: "index_assignations_on_event_id", using: :btree
  add_index "assignations", ["user_id"], name: "index_assignations_on_user_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "capacity"
    t.integer  "user_id"
    t.string   "commission"
    t.string   "locate"
    t.date     "date"
    t.string   "house"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "flyer"
    t.integer  "price"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "title"
    t.text     "content"
    t.integer  "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "status"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.text     "information"
    t.string   "price"
    t.integer  "max_income"
    t.integer  "max_users"
    t.integer  "max_events"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "cuantity"
    t.integer  "total"
    t.date     "sold"
    t.string   "status"
    t.string   "buyer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "processed"
    t.integer  "phone"
    t.string   "email"
  end

  add_index "sales", ["event_id"], name: "index_sales_on_event_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "name"
    t.string   "last_name"
    t.integer  "user_id"
    t.string   "invitationHash"
    t.string   "photo"
    t.string   "status"
    t.integer  "plan_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
