class NotificationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.sender_mailer.subject
  #
  def sender_mailer(email, msg)
    ## to pass arg to view template
    @arg_msg = { name: 'amine' }

    ## to send email with attachments
    file_path = Rails.root.join('public', 'robots.txt')
    attachments['file_name.txt'] = File.read(file_path) if file_path.present?

    ## to send email
    mail(to: email.to_s, subject: msg.to_s)
  end
end
