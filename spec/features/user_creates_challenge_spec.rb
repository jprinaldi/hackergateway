require 'rails_helper'

RSpec.feature "User creates challenge", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(user)
    challenge = FactoryGirl.build(:challenge)
    category = FactoryGirl.create(:category)
    visit new_challenge_path
    fill_in 'Name', with: challenge.name
    fill_in 'Body', with: challenge.body
    fill_in 'Answer', with: challenge.answer
    select challenge.category.name, from: 'Category'
    click_button 'Create'
    expect(page).to have_content(challenge.name)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    expect {
      visit new_challenge_path
    }.to raise_error(CanCan::AccessDenied)
  end

  scenario "without signing in" do
    expect {
      visit new_challenge_path
    }.to raise_error(CanCan::AccessDenied)
  end
end
