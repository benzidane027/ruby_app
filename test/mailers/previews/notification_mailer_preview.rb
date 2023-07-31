# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/sender_mailer
  def sender_mailer
    NotificationMailer.sender_mailer
  end

end
