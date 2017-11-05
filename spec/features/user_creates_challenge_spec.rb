# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User creates challenge", type: :feature do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "with a non-unique name" do
      existing_challenge = FactoryBot.create(:challenge)
      visit new_admin_challenge_path
      fill_in "Name*", with: existing_challenge.name
      click_button "Create"
      expect(page).to have_content("Name* has already been taken")
    end

    scenario "successfully" do
      challenge = FactoryBot.build(:challenge)
      visit new_admin_challenge_path
      select challenge.category.name, from: "Category"
      fill_in "Name*", with: challenge.name
      fill_in "Body*", with: challenge.body
      fill_in "Answer*", with: challenge.answer
      click_button "Create"
      expect(page).to have_current_path(admin_challenge_path(Challenge.last))
      expect(page).to have_content("Challenge was successfully created")
      expect(page).to have_content(challenge.name)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      visit new_admin_challenge_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      visit new_admin_challenge_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
