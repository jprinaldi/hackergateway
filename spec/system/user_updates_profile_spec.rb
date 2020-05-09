# frozen_string_literal: true

RSpec.describe "User updates profile", type: :system do
  subject { page }

  let(:user) { FactoryBot.create(:user, :confirmed) }

  before do
    login_as(user, scope: :user)
    visit edit_user_registration_path
    fill_in "Username", with: user.username
    fill_in "Current password", with: user.password
  end

  context "with a short username" do
    before do
      fill_in "Username", with: "012"
      click_button "Update"
    end

    it { is_expected.to have_current_path(edit_user_registration_path) }
  end

  context "with a long username" do
    before do
      fill_in "Username", with: "0123456789abcdef"
      click_button "Update"
    end

    it { is_expected.to have_current_path(edit_user_registration_path) }
  end

  context "with a username containing unallowed characters" do
    before do
      fill_in "Username", with: "0123_abCD"
      click_button "Update"
    end

    it { is_expected.to have_current_path(edit_user_registration_path) }
  end

  context "with a reserved username" do
    before do
      fill_in "Username", with: "admin"
      click_button "Update"
    end

    it { is_expected.to have_content("Username is reserved") }
  end

  context "with a blank email" do
    before do
      fill_in "Email", with: ""
      click_button "Update"
    end

    it { is_expected.to have_current_path(edit_user_registration_path) }
  end

  context "with a blank current password" do
    before do
      fill_in "Current password", with: ""
      click_button "Update"
    end

    it { is_expected.to have_current_path(edit_user_registration_path) }
  end

  context "with an invalid current password" do
    before do
      fill_in "Current password", with: "invalid #{user.password}"
      click_button "Update"
    end

    it { is_expected.to have_content("Current password is invalid") }
  end

  context "with valid parameters" do
    let(:new_username) { "us3rn4m3" }
    let(:success_message) { "Your account has been updated successfully" }

    before do
      fill_in "Username", with: new_username
      click_button "Update"
    end

    it { is_expected.to have_current_path(user_path(id: new_username)) }

    it { is_expected.to have_content(success_message) }

    it { is_expected.to have_content(new_username) }

    it { is_expected.not_to have_content(user.username) }
  end
end
