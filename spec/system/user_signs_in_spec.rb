# frozen_string_literal: true

RSpec.describe "User signs in", type: :system do
  subject { page }

  context "when unconfirmed" do
    before do
      user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    it { is_expected.to have_current_path(new_user_session_path) }

    it { is_expected.to have_content("Sign in") }
  end

  context "with invalid credentials" do
    before do
      user = FactoryBot.create(:user, :confirmed)
      invalid_password = "invalid #{user.password}"
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: invalid_password
      click_button "Sign in"
    end

    it { is_expected.to have_current_path(new_user_session_path) }

    it { is_expected.to have_content("Sign in") }
  end

  context "with valid credentials" do
    before do
      user = FactoryBot.create(:user, :confirmed)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    it { is_expected.to have_current_path(root_path) }

    it { is_expected.to have_content("Signed in successfully") }
  end
end
