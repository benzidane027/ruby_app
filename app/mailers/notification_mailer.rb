class NotificationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.sender_mailer.subject
  #
  def sender_mailer(email, msg)
    @arg_msg = { name: 'amine' }
    mail(to: email.to_s, subject: msg.to_s)
  end
end
