# frozen_string_literal: true

# This model represents API keys consisting of access tokens
class ApiKey < ApplicationRecord
  has_secure_token
end
