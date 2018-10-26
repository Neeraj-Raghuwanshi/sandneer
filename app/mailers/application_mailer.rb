class ApplicationMailer < ActionMailer::Base
  default from: "riteshyuvasoft163@gmail.com"
    # reply_to: "#{APP_CONFIG['fromemail']}"
  layout 'mailer'
end

