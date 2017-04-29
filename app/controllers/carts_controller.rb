class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  protect_from_forgery except: :show
  def show
    @order_items = current_order.order_items
  end
  def summary
  end
end
