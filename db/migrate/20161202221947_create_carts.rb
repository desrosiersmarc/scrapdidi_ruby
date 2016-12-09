class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
