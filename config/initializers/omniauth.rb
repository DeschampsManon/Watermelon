Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 'deschamps.manon.91@gmail.com', 'GmailP@ssword', {
      scope: ['email'] }
end