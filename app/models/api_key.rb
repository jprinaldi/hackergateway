# This model represents API keys consisting of access tokens
class ApiKey < ApplicationRecord
  before_create :generate_token

  private

  def generate_token
    loop do
      self.token = SecureRandom.hex
      break unless self.class.exists?(token: token)
    end
  end
end
