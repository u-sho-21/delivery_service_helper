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

ActiveRecord::Schema.define(version: 2020_07_08_070542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menus", force: :cascade do |t|
    t.string "image", comment: "商品画像"
    t.string "menu_name", default: "", null: false, comment: "商品名"
    t.integer "price", default: 0, null: false, comment: "値段"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_menus_on_store_id"
  end

  create_table "shop_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "login_id", default: "", null: false
    t.string "name", default: "", null: false
    t.string "phone_num", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_shop_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shop_users_on_reset_password_token", unique: true
  end

  create_table "store_order_infos", force: :cascade do |t|
    t.string "reception_email", default: "", null: false, comment: "注文メール受付先"
    t.integer "transport_fee", null: false, comment: "送料"
    t.string "delivery_reception_time_1", default: "", null: false, comment: "配達受付時間(月)"
    t.string "delivery_reception_time_2", default: "", null: false, comment: "配達受付時間(火)"
    t.string "delivery_reception_time_3", default: "", null: false, comment: "配達受付時間(水)"
    t.string "delivery_reception_time_4", default: "", null: false, comment: "配達受付時間(木)"
    t.string "delivery_reception_time_5", default: "", null: false, comment: "配達受付時間(金)"
    t.string "delivery_reception_time_6", default: "", null: false, comment: "配達受付時間(土)"
    t.string "delivery_reception_time_7", default: "", null: false, comment: "配達受付時間(日)"
    t.bigint "store_id"
    t.text "comment", default: "", comment: "注意事項など"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_order_infos_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store_name", default: "", null: false, comment: "店舗名"
    t.string "phone_num", default: "", null: false, comment: "電話番号"
    t.string "post_code", default: "", null: false, comment: "郵便番号"
    t.integer "prefecture_id", default: 0, null: false, comment: "都道府県"
    t.string "city", default: "", null: false, comment: "市区町村"
    t.string "block", default: "", null: false, comment: "町名番地等"
    t.string "building", default: "", comment: "建物名"
    t.string "holiday", default: "", null: false, comment: "定休日"
    t.string "home_url", default: "", comment: "ホームページURL"
    t.time "business_hours_start", null: false, comment: "営業開始時間"
    t.time "business_hours_finish", null: false, comment: "営業終了時間"
    t.bigint "shop_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_user_id"], name: "index_stores_on_shop_user_id"
  end

  add_foreign_key "menus", "stores"
  add_foreign_key "stores", "shop_users"
end
