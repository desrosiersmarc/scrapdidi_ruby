class SummariesController < ApplicationController
  def show
    # @order = Order.find(current_order.id)
    @order_items = current_order.order_items
  end

  # TO_DO create a partial to the cart resume


end
