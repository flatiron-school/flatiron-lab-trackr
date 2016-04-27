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

ActiveRecord::Schema.define(version: 20160427203920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "roster_csv_file_name"
    t.string   "roster_csv_content_type"
    t.integer  "roster_csv_file_size"
    t.datetime "roster_csv_updated_at"
  end

  add_index "cohorts", ["name"], name: "index_cohorts_on_name", using: :btree

  create_table "labs", force: :cascade do |t|
    t.string   "name"
    t.string   "repo"
    t.integer  "cohort_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.datetime "deploy_date"
  end

  add_index "labs", ["cohort_id"], name: "index_labs_on_cohort_id", using: :btree

  create_table "pull_request_files", force: :cascade do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "pull_request_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pull_request_files", ["pull_request_id"], name: "index_pull_request_files_on_pull_request_id", using: :btree

  create_table "pull_requests", force: :cascade do |t|
    t.string   "url"
    t.integer  "lab_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pr_number"
  end

  add_index "pull_requests", ["lab_id"], name: "index_pull_requests_on_lab_id", using: :btree
  add_index "pull_requests", ["student_id"], name: "index_pull_requests_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "github_username"
    t.integer  "cohort_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slug"
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id", using: :btree

  add_foreign_key "labs", "cohorts"
  add_foreign_key "pull_request_files", "pull_requests"
  add_foreign_key "pull_requests", "labs"
  add_foreign_key "pull_requests", "students"
  add_foreign_key "students", "cohorts"
end
