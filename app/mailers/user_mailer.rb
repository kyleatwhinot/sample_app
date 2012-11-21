class UserMailer < ActionMailer::Base
  default from: "nice-work@whinot.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "registration confirmation")
  end

end
