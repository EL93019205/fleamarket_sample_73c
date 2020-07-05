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

ActiveRecord::Schema.define(version: 2020_07_05_073820) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "card_fullname", null: false
    t.string "card_number", limit: 16, null: false
    t.string "security_code", limit: 4, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "expiration", null: false
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "src", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "introduction", null: false
    t.bigint "user_id", null: false
    t.integer "condition", null: false
    t.integer "trading_status", null: false
    t.integer "shipping_area", null: false
    t.integer "shipping_days", null: false
    t.integer "shipping_price", null: false
    t.bigint "brand_id"
    t.bigint "category_id", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "d_family_name", null: false
    t.string "d_first_name", null: false
    t.string "d_family_name_kana", null: false
    t.string "d_first_name_kana", null: false
    t.string "zipcode", limit: 7, null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building_name"
    t.string "phone_number", limit: 11
    t.date "birthday", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "credits", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
end
