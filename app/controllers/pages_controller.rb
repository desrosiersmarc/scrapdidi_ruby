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

  def check
    UserMailer.payement_check_order(current_user, current_order).deliver_now
  end

  def transfer
    UserMailer.payement_transfer_order(current_user, current_order).deliver_now
  end

  def cash
    UserMailer.payement_cash_order(current_user, current_order).deliver_now
  end

end
