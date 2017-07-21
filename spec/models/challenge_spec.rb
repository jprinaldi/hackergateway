require "rails_helper"

RSpec.describe Challenge, type: :model do
  it "has a valid factory" do
    challenge = FactoryGirl.build(:challenge)
    expect(challenge).to be_valid
  end

  it "is invalid without a name" do
    challenge = FactoryGirl.build(:challenge, name: nil)
    expect(challenge).not_to be_valid
  end

  it "is invalid without a body" do
    challenge = FactoryGirl.build(:challenge, body: nil)
    expect(challenge).not_to be_valid
  end

  it "is invalid without a category" do
    challenge = FactoryGirl.build(:challenge, category: nil)
    expect(challenge).not_to be_valid
  end

  it "correctly updates its related objects counts when destroyed" do
    solution = FactoryGirl.create(:solution)
    expect { solution.challenge.destroy }
      .to change { Solution.count }
      .by(-1)
      .and change { solution.user.reload.solutions_count }
      .by(-1)
      .and change { solution.challenge.category.challenges_count }
      .by(-1)
  end
end
