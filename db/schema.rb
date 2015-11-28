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

ActiveRecord::Schema.define(version: 20151128153955) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "choices", force: :cascade do |t|
    t.string   "choice_path", limit: 255
    t.boolean  "collect",     limit: 1,   null: false
    t.integer  "question_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "time_of_category", limit: 4
    t.integer  "category_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "num_of_exam",      limit: 4
    t.string   "question_path",    limit: 255
    t.string   "description_path", limit: 255
    t.integer  "exam_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "choice_path",      limit: 255
    t.string   "collect_no",       limit: 255
  end

end
