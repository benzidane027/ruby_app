require_relative "boot"
require "sprockets/railtie"
require "rails/all"

require_relative "../app/midleware/auth_midleware"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

# for active admin (cuz we use rails api)
config.middleware.use ActionDispatch::Flash
config.middleware.use Rack::MethodOverride
config.middleware.use ActionDispatch::Cookies

module TestApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.api_only = true

    config.middleware.use AuthMidleWare
  end
end
