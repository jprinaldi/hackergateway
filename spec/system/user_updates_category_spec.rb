# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User updates category", type: :system do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "with a non-unique name" do
      existing_category = FactoryBot.create(:category)
      current_category = FactoryBot.create(:category)
      visit edit_admin_category_path(current_category)
      fill_in "Name*", with: existing_category.name
      click_button "Update"
      expect(page).to have_content("has already been taken")
    end

    scenario "successfully" do
      category = FactoryBot.create(:category)
      new_category_name = "c4t3g0ry"
      visit edit_admin_category_path(category)
      fill_in "Name*", with: new_category_name
      click_button "Update"
      expect(page).to have_current_path(admin_category_path(new_category_name))
      expect(page).not_to have_content(category.name)
      expect(page).to have_content(new_category_name)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      category = FactoryBot.create(:category)
      visit edit_admin_category_path(category)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      category = FactoryBot.create(:category)
      visit edit_admin_category_path(category)
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
