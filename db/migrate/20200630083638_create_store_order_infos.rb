class CreateStoreOrderInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :store_order_infos do |t|
      t.string :reception_email, null: false, default: "", comment: "注文メール受付先"
      t.integer :transport_fee, null: false, default: "", comment: "送料"
      t.string :delivery_reception_time_1, null: false, default: "", comment: "配達受付時間(月)"
      t.string :delivery_reception_time_2, null: false, default: "", comment: "配達受付時間(火)"
      t.string :delivery_reception_time_3, null: false, default: "", comment: "配達受付時間(水)"
      t.string :delivery_reception_time_4, null: false, default: "", comment: "配達受付時間(木)"
      t.string :delivery_reception_time_5, null: false, default: "", comment: "配達受付時間(金)"
      t.string :delivery_reception_time_6, null: false, default: "", comment: "配達受付時間(土)"
      t.string :delivery_reception_time_7, null: false, default: "", comment: "配達受付時間(日)"
      t.belongs_to :store, commnt: "storeと1対1"
      t.text :comment, default: "", comment: "注意事項など"

      t.timestamps
    end
  end
end
