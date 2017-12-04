# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User creates solution", type: :system do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "which already exists" do
      existing_solution = FactoryBot.create(:solution)
      visit new_admin_solution_path
      select existing_solution.user.username, from: "User*"
      select existing_solution.challenge.name, from: "Challenge*"
      click_button "Create"
      expect(page).to have_content("has already solved this challenge")
    end

    scenario "successfully" do
      solution = FactoryBot.build(:solution)
      visit new_admin_solution_path
      select solution.user.username, from: "User*"
      select solution.challenge.name, from: "Challenge*"
      click_button "Create"
      expect(page).to have_current_path(admin_solution_path(Solution.last))
      expect(page).to have_content("Solution was successfully created")
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      visit new_admin_solution_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      visit new_admin_solution_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
