# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User visits someone's profile", type: :feature do
  scenario "successfully" do
    user = FactoryBot.create(:user)
    visit user_path(user)
    expect(page)
      .to have_current_path(user_path(user))
      .and have_content(user.username)
  end
end
