class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILER_SENDER_ADDRESS"]
end
