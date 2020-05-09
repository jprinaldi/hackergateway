# frozen_string_literal: true

RSpec.describe "User updates admin user", type: :system do
  subject { page }

  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:this_admin_user) { FactoryBot.create(:admin_user) }

  context "when signed in as an admin user" do
    before { login_as(admin_user, scope: :admin_user) }

    context "with a non-unique email" do
      let(:that_admin_user) { FactoryBot.create(:admin_user) }

      before do
        visit edit_admin_admin_user_path(this_admin_user)
        fill_in "Email*", with: that_admin_user.email
        click_button "Update"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid parameters" do
      let(:new_admin_user_email) { "new.admin@email.com" }
      let(:this_admin_user_path) { admin_admin_user_path(this_admin_user) }

      before do
        visit edit_admin_admin_user_path(this_admin_user)
        fill_in "Email*", with: new_admin_user_email
        fill_in "Password*", with: this_admin_user.password
        click_button "Update"
      end

      it { is_expected.to have_current_path(this_admin_user_path) }

      it { is_expected.not_to have_content(this_admin_user.email) }

      it { is_expected.to have_content(new_admin_user_email) }
    end
  end

  context "when signed in as a user" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit edit_admin_admin_user_path(this_admin_user)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before { visit edit_admin_admin_user_path(this_admin_user) }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
