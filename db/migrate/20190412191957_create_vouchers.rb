class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|
      t.string :name
      t.boolean :is_applied
      t.float :discount
      t.timestamps
    end
  end
end
