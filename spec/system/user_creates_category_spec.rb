# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User creates category", type: :system do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "with a non-unique name" do
      existing_category = FactoryBot.create(:category)
      visit new_admin_category_path
      fill_in "Name*", with: existing_category.name
      click_button "Create"
      expect(page).to have_content("has already been taken")
    end

    scenario "successfully" do
      category = FactoryBot.build(:category)
      visit new_admin_category_path
      fill_in "Name*", with: category.name
      click_button "Create"
      expect(page).to have_current_path(admin_category_path(Category.last))
      expect(page).to have_content("Category was successfully created")
      expect(page).to have_content(category.name)
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      visit new_admin_category_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      visit new_admin_category_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
