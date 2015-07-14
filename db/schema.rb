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

ActiveRecord::Schema.define(version: 20150708111714) do

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "periods", force: :cascade do |t|
    t.string   "description"
    t.integer  "duration"
    t.integer  "row_order"
    t.integer  "practice_plan_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "periods", ["practice_plan_id", "row_order"], name: "index_periods_on_practice_plan_id_and_row_order"
  add_index "periods", ["practice_plan_id"], name: "index_periods_on_practice_plan_id"

  create_table "practice_plans", force: :cascade do |t|
    t.string   "description"
    t.date     "date"
    t.time     "start_time"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "team_id"
  end

  add_index "practice_plans", ["user_id", "created_at"], name: "index_practice_plans_on_user_id_and_created_at"
  add_index "practice_plans", ["user_id"], name: "index_practice_plans_on_user_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.boolean  "private",     default: false
    t.string   "level"
    t.string   "mascot"
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "initials"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "gender"
    t.string   "sport"
    t.string   "competition_level"
    t.integer  "school_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "teams", ["school_id"], name: "index_teams_on_school_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
