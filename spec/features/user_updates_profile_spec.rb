require 'rails_helper'

RSpec.feature 'User updates profile', type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user, :confirmed)
    login_as(@user)
  end

  scenario 'with a short username' do
    visit edit_user_registration_path
    fill_in 'Username', with: '012'
    fill_in 'Current password', with: @user.password
    click_button 'Update'
    expect(page).to have_content('Username is too short')
  end

  scenario 'with a long username' do
    visit edit_user_registration_path
    fill_in 'Username', with: '0123456789abcdef'
    fill_in 'Current password', with: @user.password
    click_button 'Update'
    expect(page).to have_content('Username is too long')
  end

  scenario 'with a username containing unallowed characters' do
    visit edit_user_registration_path
    fill_in 'Username', with: '0123_abCD'
    fill_in 'Current password', with: @user.password
    click_button 'Update'
    expect(page)
      .to have_content('Username only allows letters, numbers and hyphens')
  end

  scenario 'with an invalid current password' do
    new_username = 'us3rn4m3'
    invalid_password = 'p4ssw0rd'
    visit edit_user_registration_path
    fill_in 'Username', with: new_username
    fill_in 'Current password', with: invalid_password
    click_button 'Update'
    expect(page).to have_content('Current password is invalid')
    expect(page).to have_content(@user.username)
    expect(page).not_to have_content(new_username)
  end

  scenario 'with the correct current password' do
    new_username = 'us3rn4m3'
    visit edit_user_registration_path
    fill_in 'Username', with: new_username
    fill_in 'Current password', with: @user.password
    click_button 'Update'
    expect(page).to have_content(new_username)
    expect(page).not_to have_content(@user.username)
  end
end
