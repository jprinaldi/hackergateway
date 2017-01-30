require 'rails_helper'

RSpec.feature "User signs in", type: :feature do
  scenario "with valid credentials" do
    user = FactoryGirl.create(:user, :confirmed)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Sign out')
  end

  scenario "with valid credentials while being unconfirmed" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Sign in')
  end

  scenario "with invalid credentials" do
    user = FactoryGirl.create(:user, :confirmed)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password.concat('x')
    click_button 'Sign in'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Sign in')
  end
end
