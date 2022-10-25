# frozen_string_literal: true

RSpec.describe User do
  context "with valid properties" do
    subject(:user) { build(:user) }

    it { is_expected.to be_valid }
  end

  context "without an email" do
    subject(:user) { build(:user, email: nil) }

    it { is_expected.not_to be_valid }
  end

  context "with a non-unique email" do
    subject(:user) { build(:user, email: existing_user.email) }

    let(:existing_user) { create(:user) }

    it { is_expected.not_to be_valid }
  end

  context "without a username" do
    subject(:user) { build(:user, username: nil) }

    it { is_expected.not_to be_valid }
  end

  context "with a short username" do
    subject(:user) { build(:user, username: "012") }

    it { is_expected.not_to be_valid }
  end

  context "with a long username" do
    subject(:user) { build(:user, username: "0123456789abcdef") }

    it { is_expected.not_to be_valid }
  end

  context "with a username containing unallowed characters" do
    subject(:user) { build(:user, username: "0123_abCD") }

    it { is_expected.not_to be_valid }
  end

  context "with a non-unique username" do
    subject(:user) { build(:user, username: existing_user.username) }

    let(:existing_user) { create(:user) }

    it { is_expected.not_to be_valid }
  end

  context "without a password" do
    subject(:user) { build(:user, password: nil) }

    it { is_expected.not_to be_valid }
  end

  context "with a short password" do
    subject(:user) { build(:user, password: "a" * 7) }

    it { is_expected.not_to be_valid }
  end

  context "with a long password" do
    subject(:user) { build(:user, password: "a" * 129) }

    it { is_expected.not_to be_valid }
  end

  context "without a country code" do
    subject(:user) { build(:user, country_code: nil) }

    it { is_expected.to be_valid }
  end

  context "with an invalid country code" do
    subject(:user) { build(:user, country_code: "XX") }

    it { is_expected.not_to be_valid }
  end

  context "with a valid country code" do
    subject(:country) { user.country }

    let(:user) { build(:user, country_code: "AR") }

    it "has a valid country name" do
      expect(country.iso_short_name).to eq("Argentina")
    end

    it "has a valid country emoji flag" do
      expect(country.emoji_flag).to eq("🇦🇷")
    end
  end

  context "when solving a challenge" do
    let(:user) { create(:user, :confirmed) }
    let(:challenge) { create(:challenge) }
    let(:other_user) { create(:user, :confirmed) }
    let(:other_challenge) { create(:challenge) }
    let(:challenges) { [challenge, other_challenge] }

    it "increments the total solutions count" do
      expect { user.solve(challenge) }
        .to change(Solution, :count)
        .by(1)
    end

    it "increments the user's solutions count" do
      expect { user.solve(challenge) }
        .to change(user, :solutions_count)
        .by(1)
    end

    it "increments the challenge's solutions count" do
      expect { user.solve(challenge) }
        .to change(challenge, :solutions_count)
        .by(1)
    end

    context "when not in first place" do
      before do
        other_user.solve(challenge)
      end

      it "can improve her rank" do
        expect { challenges.map { |challenge| user.solve(challenge) } }
          .to change(user, :rank)
          .by(-1)
      end
    end

    context "when not in last place" do
      before do
        user.solve(challenge)
      end

      it "can lose her rank" do
        expect { challenges.map { |challenge| other_user.solve(challenge) } }
          .to change(user, :rank)
          .by(1)
      end
    end
  end

  context "when destroyed" do
    let(:solution) { create(:solution) }

    it "correctly updates its related objects counts" do
      expect { solution.user.destroy }
        .to change(Solution, :count)
        .by(-1)
        .and change { solution.challenge.reload.solutions_count }
        .by(-1)
    end
  end

  context "when destroying the only solution" do
    subject { user.last_solution_at }

    let(:user) { create(:user, :confirmed) }
    let(:challenge) { create(:challenge) }
    let!(:only_solution) { user.solve(challenge) }

    before do
      only_solution.destroy
    end

    it { is_expected.to be_nil }
  end

  context "when destroying the last solution" do
    subject { user.last_solution_at }

    let(:user) { create(:user, :confirmed) }
    let(:first_challenge) { create(:challenge) }
    let(:second_challenge) { create(:challenge) }
    let!(:first_solution) { user.solve(first_challenge) }
    let!(:last_solution) do
      Timecop.travel(1.day.from_now)
      last_solution = user.solve(second_challenge)
      Timecop.return
      last_solution
    end

    before do
      last_solution.destroy
    end

    it { is_expected.to be_within(1.second).of first_solution.created_at }
  end
end
