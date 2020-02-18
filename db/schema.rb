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

ActiveRecord::Schema.define(version: 2020_02_18_053732) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "large_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "large_category_medium_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "large_category_id"
    t.bigint "medium_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["large_category_id"], name: "index_large_category_medium_categories_on_large_category_id"
    t.index ["medium_category_id"], name: "index_large_category_medium_categories_on_medium_category_id"
  end

  create_table "medium_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medium_category_small_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "medium_category_id"
    t.bigint "small_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_category_id"], name: "index_medium_category_small_categories_on_medium_category_id"
    t.index ["small_category_id"], name: "index_medium_category_small_categories_on_small_category_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "price", null: false
    t.string "send_sellprefecture", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "credit_number", null: false
    t.integer "valid_year", null: false
    t.integer "valid_month", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchase_credits_on_user_id"
  end

  create_table "purchase_destinations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "p_last_name", null: false
    t.string "p_first_name", null: false
    t.string "p_first_name_kana", null: false
    t.string "p_last_name_kana", null: false
    t.string "p_postcode", null: false
    t.string "p_prefecture", null: false
    t.string "p_city", null: false
    t.string "p_block", null: false
    t.string "p_building"
    t.string "p_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchase_destinations_on_user_id"
  end

  create_table "send_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "send_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "send_priceburdens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "small_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "birthday_year", null: false
    t.string "birthday_month", null: false
    t.string "birthday_date", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "large_category_medium_categories", "large_categories"
  add_foreign_key "large_category_medium_categories", "medium_categories"
  add_foreign_key "medium_category_small_categories", "medium_categories"
  add_foreign_key "medium_category_small_categories", "small_categories"
  add_foreign_key "purchase_credits", "users"
end
