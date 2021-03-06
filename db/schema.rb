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

ActiveRecord::Schema.define(version: 20171015020802) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment",     limit: 65535
    t.integer  "founded",     limit: 4
    t.integer  "lost_pet_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "comments", ["lost_pet_id"], name: "index_comments_on_lost_pet_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lost_pets", force: :cascade do |t|
    t.string   "status",      limit: 255
    t.text     "info",        limit: 65535
    t.date     "report_date"
    t.date     "lost_date"
    t.string   "latitude",    limit: 255
    t.string   "longitude",   limit: 255
    t.date     "found_date"
    t.integer  "pet_id",      limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "district_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "lost_pets", ["district_id"], name: "index_lost_pets_on_district_id", using: :btree
  add_index "lost_pets", ["pet_id"], name: "index_lost_pets_on_pet_id", using: :btree
  add_index "lost_pets", ["user_id"], name: "index_lost_pets_on_user_id", using: :btree

  create_table "my_searches", force: :cascade do |t|
    t.integer  "lost_pet_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "state",       limit: 4
  end

  add_index "my_searches", ["lost_pet_id"], name: "index_my_searches_on_lost_pet_id", using: :btree
  add_index "my_searches", ["user_id"], name: "index_my_searches_on_user_id", using: :btree

  create_table "orderdetails", force: :cascade do |t|
    t.integer  "quantity",   limit: 4
    t.decimal  "price",                precision: 12, scale: 3
    t.decimal  "subtotal",             precision: 12, scale: 3
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "orderdetails", ["order_id"], name: "index_orderdetails_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "store_id",       limit: 4
    t.datetime "date"
    t.string   "payment_method", limit: 255
    t.string   "status",         limit: 255
    t.decimal  "total",                      precision: 12, scale: 3
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "orders", ["store_id"], name: "index_orders_on_store_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pet_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "sex",                limit: 255
    t.integer  "age",                limit: 4
    t.string   "vaccinated",         limit: 255
    t.text     "information",        limit: 65535
    t.string   "state",              limit: 255
    t.integer  "pet_type_id",        limit: 4
    t.integer  "user_id",            limit: 4
    t.integer  "race_id",            limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.text     "picture",            limit: 65535
  end

  add_index "pets", ["pet_type_id"], name: "index_pets_on_pet_type_id", using: :btree
  add_index "pets", ["race_id"], name: "index_pets_on_race_id", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.string   "description", limit: 255
    t.decimal  "price",                   precision: 12, scale: 3
    t.boolean  "active",      limit: 1
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "lastname",           limit: 255
    t.string   "address",            limit: 255
    t.string   "sex",                limit: 255
    t.integer  "user_id",            limit: 4
    t.integer  "district_id",        limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.text     "picture",            limit: 65535
  end

  add_index "profiles", ["district_id"], name: "index_profiles_on_district_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "races", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "storecategories", force: :cascade do |t|
    t.integer  "store_id",    limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "storecategories", ["category_id"], name: "index_storecategories_on_category_id", using: :btree
  add_index "storecategories", ["store_id"], name: "index_storecategories_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "phone",      limit: 255
    t.string   "latitude",   limit: 255
    t.string   "longitude",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255, default: "", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "comments", "lost_pets"
  add_foreign_key "comments", "users"
  add_foreign_key "lost_pets", "districts"
  add_foreign_key "lost_pets", "pets"
  add_foreign_key "lost_pets", "users"
  add_foreign_key "my_searches", "lost_pets"
  add_foreign_key "my_searches", "users"
  add_foreign_key "orderdetails", "orders"
  add_foreign_key "orders", "stores"
  add_foreign_key "orders", "users"
  add_foreign_key "pets", "pet_types"
  add_foreign_key "pets", "races"
  add_foreign_key "pets", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "profiles", "districts"
  add_foreign_key "profiles", "users"
  add_foreign_key "storecategories", "categories"
  add_foreign_key "storecategories", "stores"
end
