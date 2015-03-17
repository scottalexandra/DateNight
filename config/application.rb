require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DateNight
  class Application < Rails::Application
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: 'smtp.mandrillapp.com',
      port: 587,
      domain: "date_night.io",
      user_name: ENV['MANDRILL_USERNAME'],
      password: ENV['MANDRILL_API_KEY'],
      authentication: 'plain',
      enable_startls_auto: true 
    }
    config.active_record.raise_in_transactional_callbacks = true
  end
end
