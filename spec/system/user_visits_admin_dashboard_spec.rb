# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User visits admin dashobard", type: :system do
  context "when signed in as an admin user" do
    before do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    it "successfully" do
      visit admin_root_path
      expect(page).to have_current_path(admin_root_path)
    end
  end

  context "when signed in as a user" do
    before do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    it "unsuccessfully" do
      visit admin_root_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "when not signed in" do
    it "unsuccessfully" do
      visit admin_root_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
