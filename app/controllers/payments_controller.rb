class PaymentsController < ApplicationController

  def new
    @order_items = current_order.order_items
    @class_hidden = "hidden"
  end
end
