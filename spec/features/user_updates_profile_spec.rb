require 'rails_helper'

RSpec.feature "User updates profile", type: :feature do
  scenario "with a short username" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    visit edit_user_registration_path
    fill_in 'Username', with: '012'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content("Username is too short")
  end

  scenario "with a long username" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    visit edit_user_registration_path
    fill_in 'Username', with: '0123456789abcdef'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content("Username is too long")
  end

  scenario "with a username containing unallowed characters" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    visit edit_user_registration_path
    fill_in 'Username', with: '0123_abCD'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content("Username only allows letters, numbers and hyphens")
  end

  scenario "with an invalid password" do
    user = FactoryGirl.create(:user, :confirmed)
    new_username = "us3rn4m3"
    invalid_password = "p4ssw0rd"
    login_as(user)
    visit edit_user_registration_path
    fill_in 'Username', with: new_username
    fill_in 'Current password', with: invalid_password
    click_button 'Update'
    expect(page).to have_content("Current password is invalid")
    expect(page).to have_content(user.username)
    expect(page).not_to have_content(new_username)
  end

  scenario "with a valid password" do
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
end
