require 'rails_helper'

RSpec.feature "User updates challenge", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    challenge = FactoryGirl.create(:challenge)
    new_challenge_name = "ch4ll3ng3"
    login_as(user)
    visit edit_challenge_path(challenge)
    fill_in 'Name', with: new_challenge_name
    click_button 'Update'
    expect(page).to have_content(new_challenge_name)
    expect(page).not_to have_content(challenge.name)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    challenge = FactoryGirl.create(:challenge)
    login_as(user)
    expect {
      visit edit_challenge_path(challenge)
    }.to raise_error(CanCan::AccessDenied)
  end

  scenario "without signing in" do
    challenge = FactoryGirl.create(:challenge)
    expect {
      visit edit_challenge_path(challenge)
    }.to raise_error(CanCan::AccessDenied)
  end
end
