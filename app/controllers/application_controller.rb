class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      # In case of problem. Console/Application/Clear Storage
      Order.find(session[:order_id])
    else
      Order.create
    end
  end


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname,
      :lastname, :address, :mobil_phone, :birth_date, :newsletter, :loyalty])
  end
end
