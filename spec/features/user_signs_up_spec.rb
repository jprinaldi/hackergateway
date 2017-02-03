require 'rails_helper'

RSpec.feature "User signs up", type: :feature do
  scenario "without entering username" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    check 'terms'
    click_button 'Sign up'
    expect(page).to have_content("Username can't be blank")
  end

  scenario "without entering email" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    check 'terms'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
  end

  scenario "without entering password" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    check 'terms'
    click_button 'Sign up'
    expect(page).to have_content("Password can't be blank")
  end

  scenario "with matching passwords" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    check 'terms'
    click_button 'Sign up'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('activate your account')
  end

  scenario "with non-matching passwords" do
    user = FactoryGirl.build(:user)
    non_matching_password = "non-matching #{user.password}"
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: non_matching_password
    check 'terms'
    click_button 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'with a short password' do
    user = FactoryGirl.build(:user)
    short_password = 'a' * 7
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: short_password
    fill_in 'Password confirmation', with: short_password
    check 'terms'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short')
  end

  scenario 'with a long password' do
    user = FactoryGirl.build(:user)
    long_password = 'a' * 129
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: long_password
    fill_in 'Password confirmation', with: long_password
    check 'terms'
    click_button 'Sign up'
    expect(page).to have_content('Password is too long')
  end

  scenario "without accepting terms" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content("Terms of service must be accepted")
  end
end
