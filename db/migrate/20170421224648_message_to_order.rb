class MessageToOrder < ActiveRecord::Migration[5.0]
  def change
    change_table :orders do |t|
    t.rename :message, :customer_message
    end
  end
end
