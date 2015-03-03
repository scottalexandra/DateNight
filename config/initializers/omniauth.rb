Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_oauth_key'], ENV['google_oauth_secret'], { :access_type => 'offline', :prompt => '' }
end
