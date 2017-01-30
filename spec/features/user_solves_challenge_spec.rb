require 'rails_helper'

RSpec.feature "User solves challenge", type: :feature do
  scenario "with correct answer" do
    user = FactoryGirl.create(:user, :confirmed)
    challenge = FactoryGirl.create(:challenge)
    login_as(user)
    visit challenge_path(challenge)
    fill_in 'Answer', with: challenge.answer
    click_button 'Solve'
    expect(page).to have_current_path(challenge_path(challenge))
    expect(page).to have_content("You solved this challenge!")
  end

  scenario "with incorrect answer" do
    user = FactoryGirl.create(:user, :confirmed)
    challenge = FactoryGirl.create(:challenge)
    login_as(user)
    visit challenge_path(challenge)
    fill_in 'Answer', with: challenge.answer.concat('x')
    click_button 'Solve'
    expect(page).to have_current_path(challenge_path(challenge))
    expect(page).to have_content("Your answer is wrong!")
  end

  scenario "while having already solved it" do
    user = FactoryGirl.create(:user, :confirmed)
    challenge = FactoryGirl.create(:challenge)
    solution = FactoryGirl.create(:solution, user: user, challenge: challenge)
    login_as(user)
    visit challenge_path(challenge)
    fill_in 'Answer', with: challenge.answer
    click_button 'Solve'
    expect(page).to have_current_path(challenge_path(challenge))
    expect(page).to have_content("You've already solved this challenge!")
  end

  scenario "without being logged in" do
    challenge = FactoryGirl.create(:challenge)
    visit challenge_path(challenge)
    fill_in 'Answer', with: challenge.answer
    click_button 'Solve'
    expect(page).to have_current_path(new_user_session_path)
  end
end
