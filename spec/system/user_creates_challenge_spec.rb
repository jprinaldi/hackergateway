# frozen_string_literal: true

RSpec.describe "User creates challenge", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { create(:admin_user) }
    let!(:category) { create(:category) }

    before do
      login_as(admin_user, scope: :admin_user)
      visit new_admin_challenge_path
    end

    context "with a non-unique name" do
      let(:existing_challenge) { create(:challenge) }

      before do
        fill_in "Name*", with: existing_challenge.name
        click_button "Create"
      end

      it { is_expected.to have_content("has already been taken") }
    end

    context "with valid properties" do
      let(:challenge) { build(:challenge, category: category) }
      let(:last_challenge_path) { admin_challenge_path(Challenge.last) }

      before do
        select challenge.category.name, from: "Category"
        fill_in "Name*", with: challenge.name
        fill_in "Body*", with: challenge.body
        fill_in "Answer*", with: challenge.answer
        click_button "Create"
      end

      it { is_expected.to have_current_path(last_challenge_path) }

      it { is_expected.to have_content("Challenge was successfully created") }

      it { is_expected.to have_content(challenge.name) }
    end
  end

  context "when signed in as a user" do
    let(:user) { create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit new_admin_challenge_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before { visit new_admin_challenge_path }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
