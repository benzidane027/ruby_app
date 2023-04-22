require_relative 'boot'

require 'rails/all'

require_relative '../app/midleware/auth_midleware'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.api_only = true
    config.middleware.use AuthMidleWare
  end
end
