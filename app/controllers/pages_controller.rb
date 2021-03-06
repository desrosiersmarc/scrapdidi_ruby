class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :basket, :scrapbooking, :results, :cgv, :legal ]

  def home
    @products = Product.where("home = ?", "yes").where(active: true)
    @products_new = @products.where("state = ?", "new")
    @products_promotion = @products.where("state = ?", "promotion")
    @products_topsell = @products.where("state = ?", "topsell")

    @categories = Category.where("ancestry is null").arrange

    @order_item = current_order.order_items.new

  end

  def check
    UserMailer.payement_check_order(current_user, current_order).deliver_now
    current_order.stock_update
    current_order.update( order_status_id: 2, payment_type: 'Chéque')
    @order = Order.find(current_order)
    session[:order_id] = nil
  end

  def transfer
    UserMailer.payement_transfer_order(current_user, current_order).deliver_now
    current_order.stock_update
    current_order.update( order_status_id: 2, payment_type: 'Virement')
    session[:order_id] = nil
  end

  def cash
    UserMailer.payement_cash_order(current_user, current_order).deliver_now
    current_order.stock_update
    current_order.update( order_status_id: 2, payment_type: 'Espèces')
    @order = Order.find(current_order)
    session[:order_id] = nil
  end

  def results
    @search_word = params[:search][:search_word]
    @products = Product.search_by_name_and_description(@search_word)
    @order_item = current_order.order_items.new
  end

  def cgv
  end

  def legal
  end

end
