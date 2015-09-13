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

ActiveRecord::Schema.define(version: 20150913022955) do

  create_table "citations", force: :cascade do |t|
    t.integer  "citation_number",        limit: 4
    t.datetime "citation_date"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.datetime "date_of_birth"
    t.string   "defendant_address",      limit: 255
    t.string   "defendant_city",         limit: 255
    t.string   "defendant_state",        limit: 255
    t.string   "drivers_license_number", limit: 255
    t.integer  "court_id",               limit: 4
    t.datetime "court_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "courts", force: :cascade do |t|
    t.string   "court_location", limit: 255
    t.string   "court_address",  limit: 255
    t.integer  "dress_code_id",  limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.datetime "send_date"
    t.integer  "session_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "phone_number",   limit: 255
    t.string   "email",          limit: 255
    t.string   "contact_method", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "state",          limit: 255
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.integer  "birth_day",      limit: 4
    t.integer  "birth_month",    limit: 4
    t.integer  "birth_year",     limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "role",                   limit: 255
    t.integer  "court_id",               limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, length: {"email"=>10}, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, length: {"reset_password_token"=>10}, using: :btree

  create_table "violations", force: :cascade do |t|
    t.string   "violation_number",      limit: 255
    t.string   "citation_id",           limit: 255
    t.string   "violation_description", limit: 255
    t.boolean  "warrant_status"
    t.string   "status",                limit: 255
    t.string   "warrant_number",        limit: 255
    t.datetime "status_date"
    t.integer  "fine_amount",           limit: 4
    t.integer  "court_cost",            limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
