# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User visits admin users page", type: :feature do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "successfully" do
      admin_user = FactoryBot.create(:admin_user)
      visit admin_admin_users_path
      expect(page).to have_current_path(admin_admin_users_path)
      expect(page).to have_content(admin_user.email)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      visit admin_admin_users_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      visit admin_admin_users_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
