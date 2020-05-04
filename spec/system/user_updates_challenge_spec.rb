# frozen_string_literal: true

RSpec.describe "User updates challenge", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { FactoryBot.create(:admin_user) }

    before { login_as(admin_user, scope: :admin_user) }

    context "with a non-unique name" do
      let(:existing_challenge) { FactoryBot.create(:challenge) }
      let(:current_challenge) { FactoryBot.create(:challenge) }

      before do
        visit edit_admin_challenge_path(current_challenge)
        fill_in "Name*", with: existing_challenge.name
        click_button "Update"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid parameters" do
      let(:challenge) { FactoryBot.create(:challenge) }
      let(:new_challenge_name) { "ch4ll3ng3" }
      let(:new_challenge_path) { admin_challenge_path(new_challenge_name) }

      before do
        visit edit_admin_challenge_path(challenge)
        fill_in "Name*", with: new_challenge_name
        click_button "Update"
      end

      it { is_expected.to have_current_path(new_challenge_path) }

      it { is_expected.not_to have_content(challenge.name) }

      it { is_expected.to have_content(new_challenge_name) }
    end
  end

  context "when signed in as a user" do
    let(:user) { FactoryBot.create(:user, :confirmed) }
    let(:challenge) { FactoryBot.create(:challenge) }

    before do
      login_as(user, scope: :user)
      visit edit_admin_challenge_path(challenge)
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    let(:challenge) { FactoryBot.create(:challenge) }

    before { visit edit_admin_challenge_path(challenge) }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
