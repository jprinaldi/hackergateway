require "rails_helper"

RSpec.feature "User checks leaderboard", type: :feature do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    visit leaderboard_path
    expect(page)
      .to have_current_path(leaderboard_path)
      .and have_content(user.username)
  end
end
