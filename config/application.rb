# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, :staging, or :production.
Bundler.require(*Rails.groups)

module HackerGateway
  class Application < Rails::Application # :nodoc:
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Use Rack::Attack for blocking & throttling abusive requests
    config.middleware.use Rack::Attack

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
