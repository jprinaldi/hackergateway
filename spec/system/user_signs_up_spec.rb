# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User signs up", type: :system do
  subject { page }

  let(:user) { FactoryBot.build(:user) }

  before do
    visit new_user_registration_path
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    check "terms"
  end

  context "with a short username" do
    before do
      fill_in "Username", with: "012"
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "with a long username" do
    before do
      fill_in "Username", with: "0123456789abcdef"
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "with a username containing unallowed characters" do
    before do
      fill_in "Username", with: "0123_abCD"
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "with a taken username" do
    before do
      FactoryBot.create(:user, username: "MyUsername")
      fill_in "Username", with: "mYuSeRnAmE"
      click_button "Sign up"
    end

    it { is_expected.to have_content("has already been taken") }
  end

  context "without entering username" do
    before do
      fill_in "Username", with: ""
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "without entering email" do
    before do
      fill_in "Email", with: ""
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "without entering password" do
    before do
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: ""
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "with non-matching passwords" do
    before do
      fill_in "Password confirmation", with: "non-matching #{user.password}"
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "with a short password" do
    before do
      short_password = "a" * 7
      fill_in "Password", with: short_password
      fill_in "Password confirmation", with: short_password
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "with a long password" do
    before do
      long_password = "a" * 129
      fill_in "Password", with: long_password
      fill_in "Password confirmation", with: long_password
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "without accepting terms" do
    before do
      uncheck "terms"
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(new_user_registration_path) }
  end

  context "with correct properties" do
    before do
      click_button "Sign up"
    end

    it { is_expected.to have_current_path(root_path) }

    it { is_expected.to have_content("activate your account") }
  end
end
