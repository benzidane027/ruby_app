require "test_helper"

class NotificationMailerTest < ActionMailer::TestCase
  test "sender_mailer" do
    mail = NotificationMailer.sender_mailer
    assert_equal "Sender mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
