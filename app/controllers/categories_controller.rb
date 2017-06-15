class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @categories = Category.where("ancestry is null").arrange

    category_id = params[:id].split('/').last.to_i
    @category = Category.find(category_id)

    @products = @category.products.where(active: true)

    @order_item = current_order.order_items.new
  end
end

