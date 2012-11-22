class HelpOthersMailer < ActionMailer::Base
  default from: "nice-work@whinot.com"

  def i_can_help(sender, ask, message, asker)
    @helper_name = sender.name
    @ask_description = ask.description
    @message = message.body
    @sender_url = user_url(sender)

    mail to: asker.email, cc: sender.email, subject: "#{ask.description}: #{sender.name} wants to help."
  end
end
