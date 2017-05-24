class UserMailer < ApplicationMailer

  before_action :find_user
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_us.subject
  #
  def contact_us
    mail(to: @user.email, subject: "Our Order n°#{Order.where(user_id: @user.id)}")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_order.subject
  #
  def send_order
    mail(to: @user.email, subject: "Our order n°")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.pending_order.subject
  #
  def pending_order
    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.preparation_order.subject
  #
  def preparation_order
    mail to: "to@example.org"
  end

private
  def find_user
    @user = User.find(current_order.user_id)
  end



end
