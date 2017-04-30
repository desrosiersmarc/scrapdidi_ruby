class SummariesController < ApplicationController

  def show
    @order_items = current_order.order_items
    @class_hidden = "hidden"
  end

end
