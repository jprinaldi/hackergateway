# frozen_string_literal: true

RSpec.describe "User visits admin dashobard" do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { create(:admin_user) }

    before do
      login_as(admin_user, scope: :admin_user)
      visit admin_root_path
    end

    it { is_expected.to have_current_path(admin_root_path) }
  end

  context "when signed in as a user" do
    let(:user) { create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit admin_root_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before { visit admin_root_path }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
