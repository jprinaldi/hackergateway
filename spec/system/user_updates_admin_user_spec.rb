# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User updates admin user", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    before do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :admin_user)
    end

    context "with a non-unique email" do
      before do
        existing_admin_user = FactoryBot.create(:admin_user)
        current_admin_user = FactoryBot.create(:admin_user)
        visit edit_admin_admin_user_path(current_admin_user)
        fill_in "Email*", with: existing_admin_user.email
        click_button "Update"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid parameters" do
      let(:admin_user) { FactoryBot.create(:admin_user) }
      let(:new_admin_user_email) { "3m4il@example.com" }

      before do
        visit edit_admin_admin_user_path(admin_user)
        fill_in "Email*", with: new_admin_user_email
        fill_in "Password*", with: admin_user.password
        fill_in "Password confirmation", with: admin_user.password
        click_button "Update"
      end

      it { is_expected.to have_current_path(admin_admin_user_path(admin_user)) }

      it { is_expected.not_to have_content(admin_user.email) }

      it { is_expected.to have_content(new_admin_user_email) }
    end
  end

  context "when signed in as a user" do
    before do
      user = FactoryBot.create(:user, :confirmed)
      login_as(user, scope: :user)
      admin_user = FactoryBot.create(:admin_user)
      visit edit_admin_admin_user_path(admin_user)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before do
      admin_user = FactoryBot.create(:admin_user)
      visit edit_admin_admin_user_path(admin_user)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
