require 'rails_helper'

RSpec.feature "User updates profile", type: :feature do
  scenario "with valid password" do
    user = FactoryGirl.create(:user, :confirmed)
    new_username = "us3rn4m3"
    login_as(user)
    visit edit_user_registration_path
    fill_in 'Username', with: new_username
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content(new_username)
    expect(page).not_to have_content(user.username)
  end

  scenario "with invalid password" do
    user = FactoryGirl.create(:user, :confirmed)
    new_username = "us3rn4m3"
    invalid_password = "p4ssw0rd"
    login_as(user)
    visit edit_user_registration_path
    fill_in 'Username', with: new_username
    fill_in 'Current password', with: invalid_password
    click_button 'Update'
    expect(page).to have_content(user.username)
    expect(page).not_to have_content(new_username)
  end
end
