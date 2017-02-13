require "rails_helper"

RSpec.feature "User signs up", type: :feature do
  before(:each) do
    @user = FactoryGirl.build(:user)
    visit new_user_registration_path
  end

  scenario "with a short username" do
    fill_in "Username", with: "012"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Username is too short")
  end

  scenario "with a long username" do
    fill_in "Username", with: "0123456789abcdef"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Username is too long")
  end

  scenario "with a username containing unallowed characters" do
    fill_in "Username", with: "0123_abCD"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
    click_button "Sign up"
    expect(page)
      .to have_content("Username only allows letters, numbers and hyphens")
  end

  scenario "with a taken username" do
    FactoryGirl.create(:user, username: "MyUsername")
    fill_in "Username", with: "mYuSeRnAmE"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Username has already been taken")
  end

  scenario "without entering username" do
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Username can't be blank")
  end

  scenario "without entering email" do
    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Email can't be blank")
  end

  scenario "without entering password" do
    fill_in "Username", with: @user.username
    fill_in "Email", with: @user.email
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Password can't be blank")
  end

  scenario "with non-matching passwords" do
    fill_in "Username", with: @user.username
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: "non-matching #{@user.password}"
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "with a short password" do
    short_password = "a" * 7
    fill_in "Username", with: @user.username
    fill_in "Email", with: @user.email
    fill_in "Password", with: short_password
    fill_in "Password confirmation", with: short_password
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Password is too short")
  end

  scenario "with a long password" do
    long_password = "a" * 129
    fill_in "Username", with: @user.username
    fill_in "Email", with: @user.email
    fill_in "Password", with: long_password
    fill_in "Password confirmation", with: long_password
    check "terms"
    click_button "Sign up"
    expect(page).to have_content("Password is too long")
  end

  scenario "without accepting terms" do
    fill_in "Username", with: @user.username
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    click_button "Sign up"
    expect(page).to have_content("Terms of service must be accepted")
  end

  scenario "successfully" do
    fill_in "Username", with: @user.username
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    check "terms"
    click_button "Sign up"
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("activate your account")
  end
end
