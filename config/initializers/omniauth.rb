OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "293236038772670", "4e0c678af42b1b447d7be38d8486b027"
  provider :google_oauth2, '1049827864697-dt0vq5pj5r0289nc8qf0jp6cd5l3qumk.apps.googleusercontent.com', 'Pi-R_3qTcJAPKBeqF9CkSEny'
end