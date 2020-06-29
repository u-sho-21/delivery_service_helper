class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :phone_num
      t.string :post_code
      t.integer :prefecture_id
      t.string :city
      t.string :block
      t.string :building
      t.date :holiday
      t.string :home_url
      t.time :business_hours
      t.references :shop_user, foreign_key: true

      t.timestamps
    end
  end
end
