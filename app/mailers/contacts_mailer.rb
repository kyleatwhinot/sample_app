class ContactsMailer < ActionMailer::Base
  default from: "nice-work@whinot.com"
  
  def registration_confirmation(user)
    @user = user
    attachments["rails.png"] = File.read("rails.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end
end
