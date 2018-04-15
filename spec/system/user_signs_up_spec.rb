# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User signs up", type: :system do
  before(:each) do
    @user = FactoryBot.build(:user)
    visit new_user_registration_path
    fill_in "Username", with: @user.username
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
  end

  scenario "with a short username" do
    fill_in "Username", with: "012"
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "with a long username" do
    fill_in "Username", with: "0123456789abcdef"
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "with a username containing unallowed characters" do
    fill_in "Username", with: "0123_abCD"
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "with a taken username" do
    FactoryBot.create(:user, username: "MyUsername")
    fill_in "Username", with: "mYuSeRnAmE"
    click_button "Sign up"
    expect(page).to have_content("has already been taken")
  end

  scenario "without entering username" do
    fill_in "Username", with: ""
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "without entering email" do
    fill_in "Email", with: ""
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "without entering password" do
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "with non-matching passwords" do
    fill_in "Password confirmation", with: "non-matching #{@user.password}"
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "with a short password" do
    short_password = "a" * 7
    fill_in "Password", with: short_password
    fill_in "Password confirmation", with: short_password
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "with a long password" do
    long_password = "a" * 129
    fill_in "Password", with: long_password
    fill_in "Password confirmation", with: long_password
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "without accepting terms" do
    uncheck "terms"
    click_button "Sign up"
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario "successfully" do
    click_button "Sign up"
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("activate your account")
  end
end
