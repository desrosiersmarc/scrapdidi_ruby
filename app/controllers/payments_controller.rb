class PaymentsController < ApplicationController
  before_action :set_order
  def new
    @order_items = current_order.order_items
    @class_hidden = "hidden"
  end

private
  def set_order
    @order = Order.where(order_status_id: 1).find(params[:order_id])
  end
end
