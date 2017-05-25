require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "contact_us" do
    mail = UserMailer.contact_us
    assert_equal "Contact us", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_order" do
    mail = UserMailer.send_order
    assert_equal "Send order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "pending_order" do
    mail = UserMailer.pending_order
    assert_equal "Pending order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "preparation_order" do
    mail = UserMailer.preparation_order
    assert_equal "Preparation order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
