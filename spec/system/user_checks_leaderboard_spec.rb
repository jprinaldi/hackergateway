# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User checks leaderboard", type: :system do
  it "successfully" do
    user = FactoryBot.create(:user)
    visit leaderboard_path
    expect(page)
      .to have_current_path(leaderboard_path)
      .and have_content(user.username)
  end
end
