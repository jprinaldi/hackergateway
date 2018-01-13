# frozen_string_literal: true

require "rails_helper"

RSpec.describe Solution, type: :model do
  it "has a valid factory" do
    solution = FactoryBot.build(:solution)
    expect(solution).to be_valid
  end

  it "is invalid without a user reference" do
    solution = FactoryBot.build(:solution, user: nil)
    expect(solution).not_to be_valid
  end

  it "is invalid without a challenge reference" do
    solution = FactoryBot.build(:solution, challenge: nil)
    expect(solution).not_to be_valid
  end

  it "correctly updates its related objects counts when destroyed" do
    solution = FactoryBot.create(:solution)
    expect { solution.destroy }
      .to change { solution.user.solutions_count }
      .by(-1)
      .and change { solution.challenge.solutions_count }
      .by(-1)
  end

  it "correctly updates its related objects timestamps when destroyed" do
    first_user = FactoryBot.create(:user)
    second_user = FactoryBot.create(:user)
    first_challenge = FactoryBot.create(:challenge)
    second_challenge = FactoryBot.create(:challenge)
    first_solution = first_user.solve(first_challenge)
    Timecop.travel(1.day.from_now)
    second_solution = second_user.solve(first_challenge)
    Timecop.travel(1.day.from_now)
    third_solution = first_user.solve(second_challenge)
    Timecop.return
    second_solution.destroy
    third_solution.destroy
    expect(first_user.last_solution_at)
      .to be_within(1.second).of first_solution.created_at
    expect(second_user.last_solution_at).to be_nil
    expect(first_challenge.last_solution_at)
      .to be_within(1.second).of first_solution.created_at
    expect(second_challenge.last_solution_at).to be_nil
  end
end
