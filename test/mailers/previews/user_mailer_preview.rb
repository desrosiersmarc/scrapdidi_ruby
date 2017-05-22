# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/contact_us
  def contact_us
    UserMailer.contact_us
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_order
  def send_order
    UserMailer.send_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/pending_order
  def pending_order
    UserMailer.pending_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/preparation_order
  def preparation_order
    UserMailer.preparation_order
  end

end
