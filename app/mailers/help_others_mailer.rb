class HelpOthersMailer < ActionMailer::Base
  default from: "nice-work@whinot.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.help_others_mailer.i_can_help.subject
  #

  def i_can_help2
    mail to: "kyle@whinot.com", subject: "Test email"
  end
end
