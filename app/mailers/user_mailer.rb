class UserMailer < ActionMailer::Base
  default from: "nice-work@whinot.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "registration confirmation")
  end

  def test_email
  	puts "entering"
  	mail(:to => "kylehawke@gmail.com", :subject => "test email")
  	puts "exiting"
  end

end
