require 'rails_helper'

RSpec.feature 'Admin updates challenge', type: :feature do
  before(:each) do
    admin = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(admin)
  end

  scenario 'with a non-unique name' do
    existing_challenge = FactoryGirl.create(:challenge)
    current_challenge = FactoryGirl.create(:challenge)
    visit rails_admin.edit_path(
      model_name: 'challenge',
      id: current_challenge.id
    )
    fill_in 'Name', with: existing_challenge.name
    click_button 'Save'
    expect(page).to have_current_path(
      rails_admin.edit_path(model_name: 'challenge', id: current_challenge.id)
    )
    expect(page).to have_content('Challenge failed to be updated')
    expect(page).to have_content('Name has already been taken')
  end

  scenario 'successfully' do
    challenge = FactoryGirl.create(:challenge)
    new_challenge_name = 'ch4ll3ng3'
    visit rails_admin.edit_path(model_name: 'challenge', id: challenge.id)
    fill_in 'Name', with: new_challenge_name
    click_button 'Save'
    expect(page).to have_current_path(
      rails_admin.index_path(model_name: 'challenge')
    )
    expect(page).not_to have_content(challenge.name)
    expect(page).to have_content(new_challenge_name)
  end
end
