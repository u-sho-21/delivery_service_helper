class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :image, comment: "商品画像"
      t.string :menu_name, null: false, default: "", comment: "商品名"
      t.integer :price, null: false, default: 0, comment: "値段"
      t.references :store, foreign_key:true

      t.timestamps
    end
  end
end
