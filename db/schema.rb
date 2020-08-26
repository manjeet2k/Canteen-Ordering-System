# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_26_074423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "food_item_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["food_item_id"], name: "index_cart_items_on_food_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "order_status"
    t.bigint "food_store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "favourite", default: false
    t.index ["food_store_id"], name: "index_carts_on_food_store_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "chef_profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.bigint "user_id", null: false
    t.bigint "food_store_id", null: false
    t.boolean "approved", default: false
    t.boolean "rejected", default: false
    t.json "images"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_store_id"], name: "index_chef_profiles_on_food_store_id"
    t.index ["user_id"], name: "index_chef_profiles_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employee_profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.boolean "approved", default: false
    t.boolean "rejected", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "credit", default: "0.0"
    t.index ["company_id"], name: "index_employee_profiles_on_company_id"
    t.index ["user_id"], name: "index_employee_profiles_on_user_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.string "description"
    t.bigint "food_store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_store_id"], name: "index_food_items_on_food_store_id"
  end

  create_table "food_stores", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "food_category_id", null: false
    t.boolean "indexing", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_category_id"], name: "index_food_stores_on_food_category_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "user_id", null: false
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_messages_on_cart_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "content"
    t.boolean "read", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "feedback", null: false
    t.integer "rating", default: 1
    t.bigint "user_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_reviews_on_cart_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "credit", default: "0.0"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "food_items"
  add_foreign_key "carts", "food_stores"
  add_foreign_key "carts", "users"
  add_foreign_key "chef_profiles", "food_stores"
  add_foreign_key "chef_profiles", "users"
  add_foreign_key "employee_profiles", "companies"
  add_foreign_key "employee_profiles", "users"
  add_foreign_key "food_items", "food_stores"
  add_foreign_key "food_stores", "food_categories"
  add_foreign_key "messages", "carts"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "reviews", "carts"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_profiles", "users"
end
