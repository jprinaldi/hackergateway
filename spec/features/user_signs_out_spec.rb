require 'rails_helper'

RSpec.feature "User signs out", type: :feature do
  scenario "while being signed in" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    visit root_path
    click_link 'Sign out'
    expect(page).to have_current_path(root_path)
    expect(page).not_to have_content('Sign out')
  end

  scenario "while being signed out" do
    visit root_path
    expect(page).not_to have_content('Sign out')
  end
end
