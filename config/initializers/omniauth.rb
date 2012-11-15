OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '163588703786615', '3214d0840eff7aa5b3c624268ec48eb8'
end