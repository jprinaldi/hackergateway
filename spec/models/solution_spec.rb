require 'rails_helper'

RSpec.describe Solution, type: :model do
  it 'has a valid factory' do
    solution = FactoryGirl.build(:solution)
    expect(solution).to be_valid
  end

  it 'is invalid without a user reference' do
    solution = FactoryGirl.build(:solution, user: nil)
    expect(solution).not_to be_valid
  end

  it 'is invalid without a challenge reference' do
    solution = FactoryGirl.build(:solution, challenge: nil)
    expect(solution).not_to be_valid
  end
end
