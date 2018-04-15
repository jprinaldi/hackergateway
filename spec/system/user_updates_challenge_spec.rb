# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User updates challenge", type: :system do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "with a non-unique name" do
      existing_challenge = FactoryBot.create(:challenge)
      current_challenge = FactoryBot.create(:challenge)
      visit edit_admin_challenge_path(current_challenge)
      fill_in "Name*", with: existing_challenge.name
      click_button "Update"
      expect(page).to have_content("has already been taken")
    end

    scenario "successfully" do
      challenge = FactoryBot.create(:challenge)
      new_challenge_name = "ch4ll3ng3"
      visit edit_admin_challenge_path(challenge)
      fill_in "Name*", with: new_challenge_name
      click_button "Update"
      expect(page)
        .to have_current_path(admin_challenge_path(new_challenge_name))
      expect(page).not_to have_content(challenge.name)
      expect(page).to have_content(new_challenge_name)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      challenge = FactoryBot.create(:challenge)
      visit edit_admin_challenge_path(challenge)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      challenge = FactoryBot.create(:challenge)
      visit edit_admin_challenge_path(challenge)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
