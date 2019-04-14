class CreateBasketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :basket_items do |t|
      t.string :product_name
      t.string :string
      t.string :price
      t.string :float

      t.timestamps
    end
  end
end
