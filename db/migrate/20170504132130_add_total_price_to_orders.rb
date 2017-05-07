class AddTotalPriceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_monetize :orders, :total_price, currency: { present: false}
  end
end
