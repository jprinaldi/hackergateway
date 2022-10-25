# frozen_string_literal: true

RSpec.describe "User cancels account" do
  subject { page }

  let(:user) { create(:user, :confirmed) }

  context "when signed in" do
    before do
      login_as(user, scope: :user)
      visit edit_user_registration_path
    end

    context "when accepting confirm dialog" do
      let(:success_message) { "Your account has been successfully cancelled" }

      before { accept_confirm { click_link "Cancel my account" } }

      it { is_expected.to have_current_path(root_path) }

      it { is_expected.to have_content(success_message) }
    end

    context "when dismissing confirm dialog" do
      before { dismiss_confirm { click_link "Cancel my account" } }

      it { is_expected.to have_current_path(edit_user_registration_path) }
    end
  end

  context "when not signed in" do
    before { visit edit_user_registration_path }

    it { is_expected.to have_current_path(new_user_session_path) }
  end
end
