# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User creates FAQ", type: :system do
  context "while being logged in as an admin user" do
    before(:each) do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    scenario "without a title" do
      faq = FactoryBot.build(:faq)
      visit new_admin_faq_path
      fill_in "Answer", with: faq.answer
      click_button "Create"
      expect(page).to have_content("can't be blank")
    end

    scenario "without an answer" do
      faq = FactoryBot.build(:faq)
      visit new_admin_faq_path
      fill_in "Title*", with: faq.title
      click_button "Create"
      expect(page).to have_content("can't be blank")
    end

    scenario "successfully" do
      faq = FactoryBot.build(:faq)
      visit new_admin_faq_path
      fill_in "Title*", with: faq.title
      fill_in "Answer*", with: faq.answer
      click_button "Create"
      expect(page).to have_current_path(admin_faq_path(Faq.last))
      expect(page).to have_content("Faq was successfully created")
    end
  end

  context "while being logged in as a user" do
    before(:each) do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
    end

    scenario "unsuccessfully" do
      visit new_admin_faq_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end

  context "without being logged in" do
    scenario "unsuccessfully" do
      visit new_admin_faq_path
      expect(page).to have_current_path(new_admin_user_session_path)
    end
  end
end
