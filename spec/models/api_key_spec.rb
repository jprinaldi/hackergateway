# frozen_string_literal: true

RSpec.describe ApiKey do
  subject { build(:api_key) }

  it { is_expected.to be_valid }
end
