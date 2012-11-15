ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "kylehawke@gmail.com",
  :password             => "Jun6882!",
  :authentication       => :plain,
  :enable_starttls_auto => true
}

if Rails.env.development?
	ActionMailer::Base.default_url_options[:host] = "localhost:3000"
else
	ActionMailer::Base.default_url_options[:host] = "morning-peak-3071.herokuapp.com"
end
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?