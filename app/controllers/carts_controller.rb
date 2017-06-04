class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  protect_from_forgery except: :show
  def show
    @order_items = current_order.order_items
    update_current_order_delivery = current_order
    update_current_order_delivery.delivery_id = Delivery.first.id
    update_current_order_delivery.save
  end

end
