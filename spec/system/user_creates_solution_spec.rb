# frozen_string_literal: true

RSpec.describe "User creates solution", type: :system do
  subject { page }

  context "when signed in as an admin user" do
    let(:admin_user) { FactoryBot.create(:admin_user) }

    before { login_as(admin_user, scope: :admin_user) }

    context "when it already exists" do
      let!(:existing_solution) { FactoryBot.create(:solution) }

      before do
        visit new_admin_solution_path
        select existing_solution.user.username, from: "User*"
        select existing_solution.challenge.name, from: "Challenge*"
        click_button "Create"
      end

      it { is_expected.to have_content("has already solved this challenge") }
    end

    context "with valid parameters" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:challenge) { FactoryBot.create(:challenge) }
      let(:solution) do
        FactoryBot.build(:solution, user: user, challenge: challenge)
      end
      let(:last_solution_path) { admin_solution_path(Solution.last) }

      before do
        visit new_admin_solution_path
        select solution.user.username, from: "User*"
        select solution.challenge.name, from: "Challenge*"
        click_button "Create"
      end

      it { is_expected.to have_current_path(last_solution_path) }

      it { is_expected.to have_content("Solution was successfully created") }
    end
  end

  context "when signed in as a user" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit new_admin_solution_path
    end

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end

  context "when not signed in" do
    before { visit new_admin_solution_path }

    it { is_expected.to have_current_path(new_admin_user_session_path) }
  end
end
