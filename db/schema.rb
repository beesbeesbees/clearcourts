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

ActiveRecord::Schema.define(version: 20150912152404) do

  create_table "citations", force: :cascade do |t|
    t.integer  "citation_number",        limit: 4
    t.datetime "citation_date"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.datetime "date_of_birth"
    t.string   "defendant_address",      limit: 255
    t.string   "defendant_city",         limit: 255
    t.string   "defendent_state",        limit: 255
    t.string   "drivers_license_number", limit: 255
    t.integer  "court_id",               limit: 4
    t.datetime "court_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

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
