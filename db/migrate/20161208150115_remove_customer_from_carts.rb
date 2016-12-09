class RemoveCustomerFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :carts, :customer, foreign_key: true
  end
end
