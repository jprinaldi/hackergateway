# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User visits admin dashobard", type: :feature do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "successfully" do
      visit admin_root_path
      expect(page).to have_current_path(admin_root_path)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      visit admin_root_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      visit admin_root_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
