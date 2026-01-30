# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_30_164017) do
  create_table "incidents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "job_id", null: false
    t.string "location"
    t.date "occurred_on"
    t.integer "reported_by_id", null: false
    t.integer "severity"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_incidents_on_job_id"
    t.index ["reported_by_id"], name: "index_incidents_on_reported_by_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "assigned_user_id"
    t.datetime "created_at", null: false
    t.text "description"
    t.date "scheduled_for"
    t.string "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["assigned_user_id"], name: "index_jobs_on_assigned_user_id"
  end

  create_table "time_entries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "hours"
    t.integer "job_id"
    t.text "notes"
    t.integer "timesheet_id", null: false
    t.datetime "updated_at", null: false
    t.date "work_date"
    t.index ["job_id"], name: "index_time_entries_on_job_id"
    t.index ["timesheet_id"], name: "index_time_entries_on_timesheet_id"
  end

  create_table "timesheets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.date "week_start"
    t.index ["user_id"], name: "index_timesheets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "department"
    t.integer "employee_number"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "incidents", "jobs"
  add_foreign_key "incidents", "users", column: "reported_by_id"
  add_foreign_key "jobs", "users", column: "assigned_user_id"
  add_foreign_key "time_entries", "jobs", on_delete: :nullify
  add_foreign_key "time_entries", "timesheets"
  add_foreign_key "timesheets", "users"
end
