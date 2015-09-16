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

ActiveRecord::Schema.define(version: 20150910094258) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "time_limit",      default: 0
    t.integer  "number_question", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "time_start"
    t.integer  "time_end"
    t.integer  "state",       default: 0
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "exams", ["category_id"], name: "index_exams_on_category_id"
  add_index "exams", ["user_id"], name: "index_exams_on_user_id"

  create_table "options", force: :cascade do |t|
    t.string   "content"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "state",       default: 0
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "results", force: :cascade do |t|
    t.boolean  "correct"
    t.integer  "exam_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "results", ["exam_id"], name: "index_results_on_exam_id"
  add_index "results", ["option_id"], name: "index_results_on_option_id"
  add_index "results", ["question_id"], name: "index_results_on_question_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "chat_word",                          null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "role",                   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
