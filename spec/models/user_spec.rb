require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a username" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "is valid without a country code" do
    user = FactoryGirl.build(:user, country_code: nil)
    expect(user).to be_valid
  end

  it "is invalid with an invalid country code" do
    user = FactoryGirl.build(:user, country_code: "XX")
    expect(user).not_to be_valid
  end

  it "has access to its countrie's information" do
    user = FactoryGirl.build(:user, country_code: "AR")
    country = user.country
    expect(country.name).to eq("Argentina")
    expect(country.emoji_flag).to eq("🇦🇷")
  end

  it "can solve challenges" do
    user = FactoryGirl.create(:user, :confirmed)
    challenge = FactoryGirl.create(:challenge)
    expect { user.solve(challenge) }
      .to change { Solution.count }
      .by(1)
      .and change { user.solutions_count }
      .by(1)
      .and change { challenge.solutions_count }
      .by(1)
  end

  it "can improve her rank" do
    user = FactoryGirl.create(:user, :confirmed)
    other_user = FactoryGirl.create(:user, :confirmed)
    challenge = FactoryGirl.create(:challenge)
    other_challenge = FactoryGirl.create(:challenge)
    other_user.solve(challenge)
    expect(other_user.rank).to eq(1)
    expect(user.rank).to eq(2)
    expect { user.solve(challenge) && user.solve(other_challenge) }
      .to change { user.rank }
      .by(-1)
      .and change { other_user.rank }
      .by(1)
  end

  it "correctly updates its related objects counts when destroyed" do
    solution = FactoryGirl.create(:solution)
    expect { solution.user.destroy }
      .to change { Solution.count }
      .by(-1)
      .and change { solution.challenge.reload.solutions_count }
      .by(-1)
  end
end
