# frozen_string_literal: true

RSpec.describe "User checks leaderboard", type: :system do
  subject { page }

  let!(:user) { create(:user) }

  before { visit leaderboard_path }

  it { is_expected.to have_current_path(leaderboard_path) }

  it { is_expected.to have_content(user.username) }
end
