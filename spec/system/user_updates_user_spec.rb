# frozen_string_literal: true

RSpec.describe "User updates user", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { FactoryBot.create(:admin_user) }

    before do
      login_as(admin_user, scope: :admin_user)
    end

    context "with a non-unique username" do
      let(:existing_user) { FactoryBot.create(:user) }
      let(:current_user) { FactoryBot.create(:user) }

      before do
        visit edit_admin_user_path(current_user)
        fill_in "Username*", with: existing_user.username
        click_button "Update"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid parameters" do
      let(:user) { FactoryBot.create(:user) }
      let(:new_user_username) { "us3rn4m3" }
      let(:new_user_path) { admin_user_path(new_user_username) }

      before do
        visit edit_admin_user_path(user)
        fill_in "Username*", with: new_user_username
        click_button "Update"
      end

      it { is_expected.to have_current_path(new_user_path) }

      it { is_expected.not_to have_content(user.username) }

      it { is_expected.to have_content(new_user_username) }
    end
  end

  context "when signed in as a user" do
    let(:user) { FactoryBot.create(:user, :confirmed) }
    let(:other_user) { FactoryBot.create(:user) }

    before do
      login_as(user, scope: :user)
      visit edit_admin_user_path(other_user)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    let(:other_user) { FactoryBot.create(:user) }

    before do
      visit edit_admin_user_path(other_user)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
