# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User signs out", type: :feature do
  scenario "while being signed in" do
    user = FactoryBot.create(:user, :confirmed)
    login_as(user, scope: :user)
    visit root_path
    click_link "Sign out"
    expect(page).to have_current_path(root_path)
    expect(page).not_to have_content("Sign out")
  end
end
