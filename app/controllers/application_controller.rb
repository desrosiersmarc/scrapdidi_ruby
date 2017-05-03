class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      # In case of problem. Console/Application/Clear Storage
      Order.find(session[:order_id])
    else
      Order.create
    end
  end
end
