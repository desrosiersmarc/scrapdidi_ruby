class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :state
      # t.references :subfamily, foreign_key: true
      t.references :supplier, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :purchasing_price
      t.float :coefficient
      t.integer :discount_rate
      t.integer :price
      t.integer :weight
      t.integer :stock
      t.string :description

      t.timestamps
    end
  end
end
