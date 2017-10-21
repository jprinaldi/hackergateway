require "rails_helper"

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    category = FactoryBot.build(:category)
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = FactoryBot.build(:category, name: nil)
    expect(category).not_to be_valid
  end
end
