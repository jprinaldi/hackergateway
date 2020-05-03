# frozen_string_literal: true

RSpec.describe "User cancels account", type: :system do
  subject { page }

  let(:user) { FactoryBot.create(:user, :confirmed) }

  before do
    login_as(user, scope: :user)
    visit edit_user_registration_path
  end

  context "when accepting alert" do
    let(:success_message) { "Your account has been successfully cancelled" }

    before do
      accept_alert("Are you sure?") { click_link "Cancel my account" }
    end

    it { is_expected.to have_current_path(root_path) }

    it { is_expected.to have_content(success_message) }
  end
end
