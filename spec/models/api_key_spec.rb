require "rails_helper"

RSpec.describe ApiKey, type: :model do
  it "has a valid factory" do
    api_key = FactoryBot.build(:api_key)
    expect(api_key).to be_valid
  end
end
