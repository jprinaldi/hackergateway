# frozen_string_literal: true

require_relative "production"

Rails.application.configure do
  config.action_mailer.default_url_options = { host: "staging.hackergateway.com" }

  config.after_initialize do
    # Google Analytics tracking ID
    GA.tracker = "UA-91349284-2"
  end
end
