# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User updates user", type: :system do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "with a non-unique username" do
      existing_user = FactoryBot.create(:user)
      current_user = FactoryBot.create(:user)
      visit edit_admin_user_path(current_user)
      fill_in "Username*", with: existing_user.username
      click_button "Update"
      expect(page).to have_content("has already been taken")
    end

    scenario "successfully" do
      user = FactoryBot.create(:user)
      new_user_username = "us3rn4m3"
      visit edit_admin_user_path(user)
      fill_in "Username*", with: new_user_username
      click_button "Update"
      expect(page).to have_current_path(admin_user_path(new_user_username))
      expect(page).not_to have_content(user.username)
      expect(page).to have_content(new_user_username)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      user = FactoryBot.create(:user)
      visit edit_admin_user_path(user)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      user = FactoryBot.create(:user)
      visit edit_admin_user_path(user)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
