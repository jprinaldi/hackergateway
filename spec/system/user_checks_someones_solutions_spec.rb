# frozen_string_literal: true

RSpec.describe "User checks someone's solutions" do
  subject { page }

  let(:solution) { create(:solution) }

  before { visit user_solutions_path(solution.user) }

  it { is_expected.to have_current_path(user_solutions_path(solution.user)) }

  it { is_expected.to have_content(solution.user.username) }

  it { is_expected.to have_content(solution.challenge.name) }
end
