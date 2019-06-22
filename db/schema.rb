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

ActiveRecord::Schema.define(version: 2019_06_22_021805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_entries", force: :cascade do |t|
    t.bigint "workout_entry_id"
    t.bigint "exercise_id"
    t.integer "weight"
    t.integer "sets"
    t.integer "reps"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_entries_on_exercise_id"
    t.index ["workout_entry_id"], name: "index_exercise_entries_on_workout_entry_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intentions", force: :cascade do |t|
    t.bigint "exercise_id"
    t.bigint "muscle_id"
    t.boolean "primary_muscle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_intentions_on_exercise_id"
    t.index ["muscle_id", "exercise_id"], name: "index_intentions_on_muscle_id_and_exercise_id", unique: true
    t.index ["muscle_id"], name: "index_intentions_on_muscle_id"
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regiments", force: :cascade do |t|
    t.bigint "exercise_id"
    t.bigint "workout_id"
    t.integer "sets"
    t.integer "reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.index ["exercise_id", "workout_id"], name: "index_regiments_on_exercise_id_and_workout_id", unique: true
    t.index ["exercise_id"], name: "index_regiments_on_exercise_id"
    t.index ["workout_id"], name: "index_regiments_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_entries", force: :cascade do |t|
    t.bigint "workout_id"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_workout_entries_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercise_entries", "exercises"
  add_foreign_key "exercise_entries", "workout_entries"
  add_foreign_key "intentions", "exercises"
  add_foreign_key "intentions", "muscles"
  add_foreign_key "regiments", "exercises"
  add_foreign_key "regiments", "workouts"
  add_foreign_key "workout_entries", "workouts"
  add_foreign_key "workouts", "users"
end
