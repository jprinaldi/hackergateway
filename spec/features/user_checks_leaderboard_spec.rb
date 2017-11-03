# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User checks leaderboard", type: :feature do
  scenario "successfully" do
    user = FactoryBot.create(:user)
    visit leaderboard_path
    expect(page)
      .to have_current_path(leaderboard_path)
      .and have_content(user.username)
  end
end
