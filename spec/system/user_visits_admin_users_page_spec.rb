# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User visits admin users page", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { FactoryBot.create(:admin_user) }

    before do
      login_as(admin_user, scope: :admin_user)
      visit admin_admin_users_path
    end

    it { is_expected.to have_current_path(admin_admin_users_path) }
    it { is_expected.to have_content(admin_user.email) }
  end

  context "when signed in as a user" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit admin_admin_users_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before do
      visit admin_admin_users_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
