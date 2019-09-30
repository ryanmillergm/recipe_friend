require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RecipeFriend
  class Application < Rails::Application
    config.load_defaults 5.2

    config.action_mailer.smtp_settings = {
      :address => "email-smtp.us-west-2.amazonaws.com",
      :port => 587,
      :user_name => ENV["SES_SMTP_USERNAME"],
      :password => ENV["SES_SMTP_PASSWORD"],
      :authentication => :login,
      :enable_starttls_auto => true
    }
    config.generators.system_tests = nil
  end
end
