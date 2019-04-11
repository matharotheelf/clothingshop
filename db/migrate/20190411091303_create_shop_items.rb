class CreateShopItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_items do |t|
      t.string :product_name
      t.string :category
      t.float :price
      t.integer :quantity_in_stock

      t.timestamps
    end
  end
end
