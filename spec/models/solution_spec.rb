# frozen_string_literal: true

RSpec.describe Solution do
  context "with valid parameters" do
    subject(:solution) { build(:solution) }

    it { is_expected.to be_valid }
  end

  context "without a user reference" do
    subject(:solution) { build(:solution, user: nil) }

    it { is_expected.not_to be_valid }
  end

  context "without a challenge reference" do
    subject(:solution) { build(:solution, challenge: nil) }

    it { is_expected.not_to be_valid }
  end

  context "when destroyed" do
    let(:solution) { create(:solution) }

    it "decrements the user's solutions count" do
      expect { solution.destroy }
        .to change { solution.user.solutions_count }
        .by(-1)
    end

    it "decrements the challenge's solutions count" do
      expect { solution.destroy }
        .to change { solution.challenge.solutions_count }
        .by(-1)
    end
  end
end
