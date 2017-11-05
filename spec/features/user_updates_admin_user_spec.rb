# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User updates admin user", type: :feature do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "with a non-unique email" do
      existing_admin_user = FactoryBot.create(:admin_user)
      current_admin_user = FactoryBot.create(:admin_user)
      visit edit_admin_admin_user_path(current_admin_user)
      fill_in "Email*", with: existing_admin_user.email
      click_button "Update"
      expect(page).to have_content("Email* has already been taken")
    end

    scenario "successfully" do
      admin_user = FactoryBot.create(:admin_user)
      new_admin_user_email = "3m4il@example.com"
      visit edit_admin_admin_user_path(admin_user)
      fill_in "Email*", with: new_admin_user_email
      fill_in "Password*", with: admin_user.password
      fill_in "Password confirmation", with: admin_user.password
      click_button "Update"
      expect(page).to have_current_path(admin_admin_user_path(admin_user))
      expect(page).not_to have_content(admin_user.email)
      expect(page).to have_content(new_admin_user_email)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      admin_user = FactoryBot.create(:admin_user)
      visit edit_admin_admin_user_path(admin_user)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      admin_user = FactoryBot.create(:admin_user)
      visit edit_admin_admin_user_path(admin_user)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
