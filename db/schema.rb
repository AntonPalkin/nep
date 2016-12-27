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

ActiveRecord::Schema.define(version: 20161126151606) do

  create_table "accounts", force: :cascade do |t|
    t.string   "bank"
    t.decimal  "balance"
    t.text     "description"
    t.integer  "accountable_id"
    t.string   "accountable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "currency_id"
  end

  create_table "bills", force: :cascade do |t|
    t.datetime "date"
    t.integer  "to_comp_id"
    t.integer  "from_comp_id"
    t.decimal  "sum"
    t.integer  "type_id"
    t.integer  "ioe_id"
    t.integer  "project_id"
    t.integer  "list_id"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "type_of_bill_id"
    t.decimal  "paid"
    t.integer  "account_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "visible"
    t.date     "from_date"
    t.date     "to_date"
    t.date     "pay_date"
  end

  create_table "comp_types", force: :cascade do |t|
    t.string   "comp_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comps", force: :cascade do |t|
    t.string   "brand"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.decimal  "balance"
    t.string   "bank"
    t.integer  "currency_id"
    t.string   "integer"
    t.integer  "comp_type_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.decimal  "to_dollar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "secondname"
    t.decimal  "salary"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ioes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "type_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string   "action"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "balace"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "interface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "bill_id"
    t.float    "sum"
    t.string   "type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "from_comp_id"
    t.integer  "to_comp_id"
    t.decimal  "new_balance_from"
    t.decimal  "new_balance_in"
    t.decimal  "old_balance_from"
    t.decimal  "old_balance_in"
  end

  create_table "type_ioes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_of_bills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "name"
    t.string   "permit"
    t.string   "roles",                  default: "--- []"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
