class AddDeliveryIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :delivery, index: true, foreign_key: true
  end
end
