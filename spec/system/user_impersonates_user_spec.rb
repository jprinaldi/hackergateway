# frozen_string_literal: true

RSpec.describe "User impersonates user", type: :system do
  subject { page }

  let(:user_to_impersonate) { create(:user, :confirmed) }

  context "when signed in as an admin user" do
    let(:admin_user) { create(:admin_user) }

    before do
      login_as(admin_user, scope: :admin_user)
      visit impersonate_user_path(user_to_impersonate)
    end

    it { is_expected.to have_current_path(root_path) }

    it { is_expected.not_to have_content("Sign in") }
  end

  context "when signed in as a user" do
    let(:user) { create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit impersonate_user_path(user_to_impersonate)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before { visit impersonate_user_path(user_to_impersonate) }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
