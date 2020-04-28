# frozen_string_literal: true

require "rails_helper"

RSpec.describe Challenge, type: :model do
  context "with valid properties" do
    subject(:challenge) { FactoryBot.build(:challenge) }

    it { is_expected.to be_valid }
  end

  context "without a name" do
    subject(:challenge) { FactoryBot.build(:challenge, name: nil) }

    it { is_expected.not_to be_valid }
  end

  context "without a body" do
    subject(:challenge) { FactoryBot.build(:challenge, body: nil) }

    it { is_expected.not_to be_valid }
  end

  context "without a category" do
    subject(:challenge) { FactoryBot.build(:challenge, category: nil) }

    it { is_expected.not_to be_valid }
  end

  context "when destroyed" do
    let!(:solution) { FactoryBot.create(:solution) }

    it "decrements the total solutions count" do
      expect { solution.challenge.destroy }
        .to change(Solution, :count)
        .by(-1)
    end

    it "decrements the user's solutions count" do
      expect { solution.challenge.destroy }
        .to change { solution.user.reload.solutions_count }
        .by(-1)
    end

    it "decrements the challenge's solutions count" do
      expect { solution.challenge.destroy }
        .to change { solution.challenge.category.challenges_count }
        .by(-1)
    end
  end

  context "when destroying the only solution" do
    subject { challenge.last_solution_at }

    let(:user) { FactoryBot.create(:user, :confirmed) }
    let(:challenge) { FactoryBot.create(:challenge) }
    let!(:solution) { user.solve(challenge) }

    before do
      solution.destroy
    end

    it { is_expected.to be_nil }
  end

  context "when destroying the last solution" do
    subject { challenge.last_solution_at }

    let(:challenge) { FactoryBot.create(:challenge) }
    let(:first_user) { FactoryBot.create(:user, :confirmed) }
    let(:second_user) { FactoryBot.create(:user, :confirmed) }
    let!(:first_solution) { first_user.solve(challenge) }
    let!(:last_solution) do
      Timecop.travel(1.day.from_now)
      last_solution = second_user.solve(challenge)
      Timecop.return
      last_solution
    end

    before do
      last_solution.destroy
    end

    it { is_expected.to be_within(1.second).of first_solution.created_at }
  end
end
