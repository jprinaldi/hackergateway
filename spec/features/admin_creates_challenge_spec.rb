require "rails_helper"

RSpec.feature "Admin creates challenge", type: :feature do
  before(:each) do
    admin = FactoryBot.create(:user, :confirmed, :admin)
    login_as(admin)
  end

  scenario "with a non-unique name" do
    existing_challenge = FactoryBot.create(:challenge)
    new_challenge = FactoryBot.build(:challenge)
    visit rails_admin.new_path(model_name: "challenge")
    fill_in "Name", with: existing_challenge.name
    fill_in "Body", with: new_challenge.body
    fill_in "Answer", with: new_challenge.answer
    select new_challenge.category.name, from: "Category"
    click_button "Save"
    expect(page).to have_current_path(
      rails_admin.new_path(model_name: "challenge")
    )
    expect(page).to have_content("Challenge failed to be created")
    expect(page).to have_content("Name has already been taken")
  end

  scenario "successfully" do
    challenge = FactoryBot.build(:challenge)
    visit rails_admin.new_path(model_name: "challenge")
    fill_in "Name", with: challenge.name
    fill_in "Body", with: challenge.body
    fill_in "Answer", with: challenge.answer
    select challenge.category.name, from: "Category"
    click_button "Save"
    expect(page).to have_current_path(
      rails_admin.index_path(model_name: "challenge")
    )
    expect(page).to have_content(challenge.name)
  end
end
