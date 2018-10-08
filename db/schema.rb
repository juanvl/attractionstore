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

ActiveRecord::Schema.define(version: 2018_10_08_233027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "duration_minutes"
    t.integer "max_capacity"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_attractions_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "national_registry_number"
    t.string "social_name"
    t.string "business_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "customer_types", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "national_registry_number"
    t.string "name"
    t.string "job_role"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "sale_types", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.bigint "attraction_id"
    t.bigint "customer_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_sale_types_on_attraction_id"
    t.index ["customer_type_id"], name: "index_sale_types_on_customer_type_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "sale_date"
    t.bigint "sale_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_type_id"], name: "index_sales_on_sale_type_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "attractions", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "users"
  add_foreign_key "sale_types", "attractions"
  add_foreign_key "sale_types", "customer_types"
  add_foreign_key "sales", "sale_types"
  add_foreign_key "sales", "users"
end
