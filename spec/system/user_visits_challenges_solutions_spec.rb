# frozen_string_literal: true

RSpec.describe "User checks challenge's solutions" do
  subject { page }

  let(:this_challenge) { create(:challenge) }
  let!(:solution) { create(:solution, challenge: this_challenge) }
  let(:this_challenge_solutions_path) do
    challenge_solutions_path(this_challenge)
  end

  before { visit this_challenge_solutions_path }

  it { is_expected.to have_current_path(this_challenge_solutions_path) }

  it { is_expected.to have_content(solution.user.username) }

  it { is_expected.to have_content(solution.challenge.name) }
end
