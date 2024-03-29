# frozen_string_literal: true

RSpec.describe Category do
  context "with valid properties" do
    subject(:category) { build(:category) }

    it { is_expected.to be_valid }
  end

  context "without a name" do
    subject(:category) { build(:category, name: nil) }

    it { is_expected.not_to be_valid }
  end
end
