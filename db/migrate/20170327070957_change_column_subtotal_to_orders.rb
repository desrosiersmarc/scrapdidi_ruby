class ChangeColumnSubtotalToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :subtotal, :float
  end
end
