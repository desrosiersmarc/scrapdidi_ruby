class CreateOrderStatuts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_statuts do |t|
      t.string :name

      t.timestamps
    end
  end
end
