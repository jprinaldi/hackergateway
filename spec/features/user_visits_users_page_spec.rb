# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User visits users page", type: :feature do
  scenario "successfully" do
    user = FactoryBot.create(:user)
    visit users_path
    expect(page)
      .to have_current_path(users_path)
      .and have_content(user.username)
  end
end
