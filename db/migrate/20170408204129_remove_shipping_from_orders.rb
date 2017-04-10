class RemoveShippingFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :shipping
  end
end
