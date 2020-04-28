# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User signs out", type: :system do
  subject { page }

  context "when signed in" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit root_path
      within("nav") { click_link user.username }
      click_link "Sign out"
    end

    it { is_expected.to have_current_path(root_path) }

    it { is_expected.not_to have_content("Sign out") }
  end
end
