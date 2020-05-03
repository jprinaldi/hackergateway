# frozen_string_literal: true

RSpec.describe Category, type: :model do
  context "with valid properties" do
    subject(:category) { FactoryBot.build(:category) }

    it { is_expected.to be_valid }
  end

  context "without a name" do
    subject(:category) { FactoryBot.build(:category, name: nil) }

    it { is_expected.not_to be_valid }
  end
end
