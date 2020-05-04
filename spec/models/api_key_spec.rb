# frozen_string_literal: true

RSpec.describe ApiKey, type: :model do
  subject { FactoryBot.build(:api_key) }

  it { is_expected.to be_valid }
end
