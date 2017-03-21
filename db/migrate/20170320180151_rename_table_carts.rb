class RenameTableCarts < ActiveRecord::Migration[5.0]
  def change
    rename_table :carts, :orders

  end
end
