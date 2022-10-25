# frozen_string_literal: true

RSpec.describe "User solves challenge" do
  subject { page }

  let(:this_challenge) { create(:challenge) }
  let(:this_challenge_path) { challenge_path(this_challenge) }

  before { visit challenge_path(this_challenge) }

  context "when signed in" do
    let(:user) { create(:user, :confirmed) }

    before { login_as(user, scope: :user) }

    context "with correct answer" do
      let(:solved_message) { "You solved this challenge!" }

      before do
        fill_in "Answer", with: this_challenge.answer
        click_button "Solve"
      end

      it { is_expected.to have_current_path(this_challenge_path) }

      it { is_expected.to have_content(solved_message) }
    end

    context "with incorrect answer" do
      let(:wrong_answer_message) { "Your answer is wrong!" }

      before do
        fill_in "Answer", with: "wrong #{this_challenge.answer}"
        click_button "Solve"
      end

      it { is_expected.to have_current_path(this_challenge_path) }

      it { is_expected.to have_content(wrong_answer_message) }
    end

    context "when she already solved it" do
      let(:already_solved_message) { "You've already solved this challenge!" }

      before do
        user.solve(this_challenge)
        fill_in "Answer", with: this_challenge.answer
        click_button "Solve"
      end

      it { is_expected.to have_current_path(this_challenge_path) }

      it { is_expected.to have_content(already_solved_message) }
    end
  end

  context "when not signed in" do
    before do
      fill_in "Answer", with: this_challenge.answer
      click_button "Solve"
    end

    it { is_expected.to have_current_path(new_user_session_path) }
  end
end
