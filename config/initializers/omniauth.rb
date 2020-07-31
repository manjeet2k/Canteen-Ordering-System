OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "293236038772670", "4e0c678af42b1b447d7be38d8486b027"
end