class UserMailer < ApplicationMailer
  helper :application

  def contact_us
    mail(to: @user.email, subject: "Our Order n°#{Order.where(user_id: @user.id)}")
  end

  def send_order
    mail(to: @user.email, subject: "Our order n°")
  end

  def pending_order(user, order_items, current_order)
    @user = user
    @order_items = order_items
    @current_order = current_order
    mail(to: user.email,
          subject: "[ScrapDidi] Confirmation de votre commande")
  end

  def preparation_order
    mail to: "to@example.org"
  end

  def payement_online_order(user, current_order)
    @user = user
    @current_order = current_order
    mail(to: user.email,
          subject: "[ScrapDidi] Confirmation de votre commande")
  end

  def payement_cash_order(user, current_order)
    @user = user
    @current_order = current_order
    mail(to: user.email,
          subject: "[ScrapDidi] Confirmation de votre commande")
  end

  def payement_check_order(user, current_order)
    @user = user
    @current_order = current_order
    mail(to: user.email,
          subject: "[ScrapDidi] Confirmation de votre commande")
  end

  def payement_transfer_order(user, current_order)
    @user = user
    @current_order = current_order
    mail(to: user.email,
          subject: "[ScrapDidi] Confirmation de votre commande")
  end
private




end
