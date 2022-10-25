# frozen_string_literal: true

RSpec.describe "User signs out" do
  subject { page }

  context "when signed in" do
    let(:user) { create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit root_path
      within("nav") do
        click_button
        click_link user.username
      end
      click_link "Sign out"
    end

    it { is_expected.to have_current_path(root_path) }

    it { is_expected.not_to have_content("Sign out") }
  end
end
