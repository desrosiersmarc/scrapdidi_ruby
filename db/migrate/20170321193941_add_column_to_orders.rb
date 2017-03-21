class AddColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :subtotal, :integer
    add_column :orders, :tax, :float
    add_column :orders, :shipping, :float
    add_column :orders, :total, :integer
    add_reference :orders, :order_status, foreign_key: true
  end
end
