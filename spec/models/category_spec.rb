require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    category = FactoryGirl.build(:category)
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = FactoryGirl.build(:category, name: nil)
    expect(category).not_to be_valid
  end

  it "is invalid without an icon" do
    category = FactoryGirl.build(:category, icon: nil)
    expect(category).not_to be_valid
  end
end
