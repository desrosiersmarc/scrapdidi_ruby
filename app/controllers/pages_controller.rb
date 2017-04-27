class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :basket, :scrapbooking ]

  def home
    @products = Product.where("home = ?", "yes")
    @products_new = @products.where("state = ?", "new")
    @products_promotion = @products.where("state = ?", "promotion")
    @products_topsell = @products.where("state = ?", "topsell")

    @categories = Category.where("ancestry is null").arrange

    @order_item = current_order.order_items.new

  end

  def cheque
  end

  def virement
  end

  def especes
  end

end
