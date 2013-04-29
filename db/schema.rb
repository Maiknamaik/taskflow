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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130426110627) do

  create_table "project_users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "project_users", ["project_id"], :name => "index_project_users_on_project_id"
  add_index "project_users", ["user_id"], :name => "index_project_users_on_user_id"

  create_table "projects", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "pro_date_ini"
    t.date     "pro_date_end"
    t.string   "project_name"
    t.string   "lead_responsible"
  end

  create_table "tasks", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "utility"
    t.text     "resources"
    t.integer  "workday_id"
  end

  add_index "tasks", ["workday_id"], :name => "index_tasks_on_workday_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
    t.integer  "project_id"
  end

  add_index "users", ["project_id"], :name => "index_users_on_project_id"
  add_index "users", ["state"], :name => "index_users_on_state"

  create_table "workdays", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_time"
    t.integer  "owner_id"
    t.integer  "project_id"
  end

  add_index "workdays", ["owner_id"], :name => "index_workdays_on_owner_id"

end
