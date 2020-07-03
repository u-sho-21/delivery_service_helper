class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :store_name, null: false, default: "", comment: "店舗名"
      t.string :phone_num, null: false, default: "", comment: "電話番号"
      t.string :post_code, null: false, default: "", comment: "郵便番号"
      t.integer :prefecture_id, null: false, default: 0, comment: "都道府県"
      t.string :city, null: false, default: "", comment: "市区町村"
      t.string :block, null: false, default: "", comment: "町名番地等"
      t.string :building, default: "", comment: "建物名"
      t.string :holiday, null: false, default: "", comment: "定休日"
      t.string :home_url, default: "", comment: "ホームページURL"
      t.time :business_hours_start, null: false, default: "", comment: "営業開始時間"
      t.time :business_hours_finish, null: false, default: "", comment: "営業終了時間"
      t.references :shop_user, foreign_key: true

      t.timestamps
    end
  end
end
