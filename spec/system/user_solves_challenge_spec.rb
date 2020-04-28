# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User solves challenge", type: :system do
  subject { page }

  let(:challenge) { FactoryBot.create(:challenge) }

  before do
    visit challenge_path(challenge)
  end

  context "with correct answer" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      fill_in "Answer", with: challenge.answer
      click_button "Solve"
    end

    it { is_expected.to have_current_path(challenge_path(challenge)) }

    it { is_expected.to have_content("You solved this challenge!") }
  end

  context "with incorrect answer" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      login_as(user, scope: :user)
      visit challenge_path(challenge)
      fill_in "Answer", with: "wrong #{challenge.answer}"
      click_button "Solve"
    end

    it { is_expected.to have_current_path(challenge_path(challenge)) }

    it { is_expected.to have_content("Your answer is wrong!") }
  end

  context "when she already solved it" do
    let(:user) { FactoryBot.create(:user, :confirmed) }

    before do
      user.solve(challenge)
      login_as(user, scope: :user)
      visit challenge_path(challenge)
      fill_in "Answer", with: challenge.answer
      click_button "Solve"
    end

    it { is_expected.to have_current_path(challenge_path(challenge)) }

    it { is_expected.to have_content("You've already solved this challenge!") }
  end

  context "when not signed in" do
    before do
      visit challenge_path(challenge)
      fill_in "Answer", with: challenge.answer
      click_button "Solve"
    end

    it { is_expected.to have_current_path(new_user_session_path) }
  end
end
