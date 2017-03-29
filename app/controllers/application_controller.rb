class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      # session.delete(:order_id)
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
