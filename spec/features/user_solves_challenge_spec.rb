# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User solves challenge", type: :feature do
  before(:each) do
    @challenge = FactoryBot.create(:challenge)
    visit challenge_path(@challenge)
  end

  scenario "with correct answer" do
    user = FactoryBot.create(:user, :confirmed)
    login_as(user)
    fill_in "Answer", with: @challenge.answer
    click_button "Solve"
    expect(page).to have_current_path(challenge_path(@challenge))
    expect(page).to have_content("You solved this challenge!")
  end

  scenario "with incorrect answer" do
    user = FactoryBot.create(:user, :confirmed)
    login_as(user)
    visit challenge_path(@challenge)
    fill_in "Answer", with: "wrong #{@challenge.answer}"
    click_button "Solve"
    expect(page).to have_current_path(challenge_path(@challenge))
    expect(page).to have_content("Your answer is wrong!")
  end

  scenario "while having already solved it" do
    user = FactoryBot.create(:user, :confirmed)
    user.solve(@challenge)
    login_as(user)
    visit challenge_path(@challenge)
    fill_in "Answer", with: @challenge.answer
    click_button "Solve"
    expect(page).to have_current_path(challenge_path(@challenge))
    expect(page).to have_content("You've already solved this challenge!")
  end

  scenario "without being logged in" do
    visit challenge_path(@challenge)
    fill_in "Answer", with: @challenge.answer
    click_button "Solve"
    expect(page).to have_current_path(new_user_session_path)
  end
end
