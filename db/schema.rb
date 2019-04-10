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

ActiveRecord::Schema.define(version: 2019_04_09_102549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_teches", force: :cascade do |t|
    t.integer "technician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "producer_id"
    t.string "client"
    t.string "venue"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "techs_required"
    t.string "title"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "is_technician", default: false
  end

  create_table "technicians", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "day_rate"
    t.boolean "audio", default: false
    t.boolean "video", default: false
    t.boolean "lighting", default: false
    t.boolean "general", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "is_technician", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
