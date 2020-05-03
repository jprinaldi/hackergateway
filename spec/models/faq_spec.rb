# frozen_string_literal: true

RSpec.describe Faq, type: :model do
  context "with valid properties" do
    subject(:faq) { FactoryBot.build(:faq) }

    it { is_expected.to be_valid }
  end

  context "without a title" do
    subject(:faq) { FactoryBot.build(:faq, title: nil) }

    it { is_expected.not_to be_valid }
  end

  context "without an answer" do
    subject(:faq) { FactoryBot.build(:faq, answer: nil) }

    it { is_expected.not_to be_valid }
  end
end
