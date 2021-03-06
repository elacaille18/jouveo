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

ActiveRecord::Schema.define(version: 20160705142613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "candidate_id"
    t.datetime "begins_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "interviewer_first_name"
    t.string   "interviewer_last_name"
    t.string   "interviewer_position"
  end

  add_index "appointments", ["candidate_id"], name: "index_appointments_on_candidate_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.integer  "mission_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "resume"
    t.string   "compensation_fix"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "status",                default: "jouve_interviewing"
    t.string   "compensation_variable"
    t.string   "compensation_others"
    t.string   "photo"
    t.integer  "company_id"
  end

  add_index "candidates", ["company_id"], name: "index_candidates_on_company_id", using: :btree
  add_index "candidates", ["mission_id"], name: "index_candidates_on_mission_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missions", force: :cascade do |t|
    t.string   "title"
    t.integer  "creator_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "status",        default: "in_progress"
    t.integer  "company_id"
    t.integer  "associate_id"
    t.integer  "consultant_id"
    t.integer  "assistant_id"
  end

  add_index "missions", ["assistant_id"], name: "index_missions_on_assistant_id", using: :btree
  add_index "missions", ["associate_id"], name: "index_missions_on_associate_id", using: :btree
  add_index "missions", ["company_id"], name: "index_missions_on_company_id", using: :btree
  add_index "missions", ["consultant_id"], name: "index_missions_on_consultant_id", using: :btree
  add_index "missions", ["creator_id"], name: "index_missions_on_creator_id", using: :btree

  create_table "missions_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "mission_id"
  end

  add_index "missions_users", ["mission_id", "user_id"], name: "by_mission_and_user", unique: true, using: :btree
  add_index "missions_users", ["mission_id"], name: "index_missions_users_on_mission_id", using: :btree
  add_index "missions_users", ["user_id"], name: "index_missions_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "jouve",                  default: false, null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "photo"
    t.integer  "company_id"
    t.boolean  "jouve_associate",        default: false
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "appointments", "candidates"
  add_foreign_key "candidates", "companies"
  add_foreign_key "candidates", "missions"
  add_foreign_key "missions", "companies"
  add_foreign_key "missions", "users", column: "assistant_id"
  add_foreign_key "missions", "users", column: "associate_id"
  add_foreign_key "missions", "users", column: "consultant_id"
  add_foreign_key "missions", "users", column: "creator_id"
  add_foreign_key "users", "companies"
end
