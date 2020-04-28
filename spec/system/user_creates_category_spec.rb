# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User creates category", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    before do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    context "with a non-unique name" do
      before do
        existing_category = FactoryBot.create(:category)
        visit new_admin_category_path
        fill_in "Name*", with: existing_category.name
        click_button "Create"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid parameters" do
      let(:category) { FactoryBot.build(:category) }
      let(:last_category_path) { admin_category_path(Category.last) }

      before do
        visit new_admin_category_path
        fill_in "Name*", with: category.name
        click_button "Create"
      end

      it { is_expected.to have_current_path(last_category_path) }

      it { is_expected.to have_content("Category was successfully created") }

      it { is_expected.to have_content(category.name) }
    end
  end

  context "when signed in as a user" do
    before do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
      visit new_admin_category_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before do
      visit new_admin_category_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
