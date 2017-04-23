class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.integer :min_weight
      t.integer :max_weight
      t.float :price
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
