# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "is invalid with a non-unique email" do
    existing_user = FactoryBot.create(:user)
    user = FactoryBot.build(:user, email: existing_user.email)
    expect(user).not_to be_valid
  end

  it "is invalid without a username" do
    user = FactoryBot.build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it "is invalid with a short username" do
    user = FactoryBot.build(:user, username: "012")
    expect(user).not_to be_valid
  end

  it "is invalid with a long username" do
    user = FactoryBot.build(:user, username: "0123456789abcdef")
    expect(user).not_to be_valid
  end

  it "is invalid with a username containing unallowed characters" do
    user = FactoryBot.build(:user, username: "0123_abCD")
    expect(user).not_to be_valid
  end

  it "is invalid with a non-unique username" do
    existing_user = FactoryBot.create(:user)
    user = FactoryBot.build(:user, username: existing_user.username)
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it "is invalid with a short password" do
    user = FactoryBot.build(:user, password: "a" * 7)
    expect(user).not_to be_valid
  end

  it "is invalid with a long password" do
    user = FactoryBot.build(:user, password: "a" * 129)
    expect(user).not_to be_valid
  end

  it "is valid without a country code" do
    user = FactoryBot.build(:user, country_code: nil)
    expect(user).to be_valid
  end

  it "is invalid with an invalid country code" do
    user = FactoryBot.build(:user, country_code: "XX")
    expect(user).not_to be_valid
  end

  it "has access to its countrie's information" do
    user = FactoryBot.build(:user, country_code: "AR")
    country = user.country
    expect(country.name).to eq("Argentina")
    expect(country.emoji_flag).to eq("🇦🇷")
  end

  it "can solve challenges" do
    user = FactoryBot.create(:user, :confirmed)
    challenge = FactoryBot.create(:challenge)
    expect { user.solve(challenge) }
      .to change { Solution.count }
      .by(1)
      .and change { user.solutions_count }
      .by(1)
      .and change { challenge.solutions_count }
      .by(1)
  end

  it "can improve her rank" do
    user = FactoryBot.create(:user, :confirmed)
    other_user = FactoryBot.create(:user, :confirmed)
    challenge = FactoryBot.create(:challenge)
    other_challenge = FactoryBot.create(:challenge)
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
    solution = FactoryBot.create(:solution)
    expect { solution.user.destroy }
      .to change { Solution.count }
      .by(-1)
      .and change { solution.challenge.reload.solutions_count }
      .by(-1)
  end
end
