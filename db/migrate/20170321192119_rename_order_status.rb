class RenameOrderStatus < ActiveRecord::Migration[5.0]
  def change
    rename_table :order_statuts, :order_status
  end
end
