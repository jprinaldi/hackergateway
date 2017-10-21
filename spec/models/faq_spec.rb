require "rails_helper"

RSpec.describe Faq, type: :model do
  it "has a valid factory" do
    faq = FactoryBot.build(:faq)
    expect(faq).to be_valid
  end

  it "is invalid without a title" do
    faq = FactoryBot.build(:faq, title: nil)
    expect(faq).not_to be_valid
  end

  it "is invalid without an answer" do
    faq = FactoryBot.build(:faq, answer: nil)
    expect(faq).not_to be_valid
  end
end
