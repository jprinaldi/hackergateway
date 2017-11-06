# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User impersonates user", typqe: :feature do
  before(:each) do
    @user_to_impersonate = FactoryBot.create(:user, :confirmed)
  end

  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "successfully" do
      visit impersonate_user_path(@user_to_impersonate)
      expect(page).to have_current_path(root_path)
      expect(page).not_to have_content("Sign in")
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      visit impersonate_user_path(@user_to_impersonate)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      visit impersonate_user_path(@user_to_impersonate)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
