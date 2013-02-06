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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130206114011) do

  create_table "activities", :force => true do |t|
    t.integer  "task_id"
    t.integer  "context_id"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contexts", :force => true do |t|
    t.string   "title"
    t.integer  "max_minutes"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "picture_content_type"
    t.string   "status"
    t.integer  "active_task_id"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "context_id"
  end

end
