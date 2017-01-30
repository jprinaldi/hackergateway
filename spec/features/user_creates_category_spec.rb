require 'rails_helper'

RSpec.feature "User creates category", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(user)
    category = FactoryGirl.build(:category)
    visit new_category_path
    fill_in 'Name', with: category.name
    fill_in 'Icon', with: category.icon
    click_button 'Create'
    expect(page).to have_content(category.name)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    expect {
      visit new_category_path
    }.to raise_error(CanCan::AccessDenied)
  end

  scenario "without signing in" do
    expect {
      visit new_category_path
    }.to raise_error(CanCan::AccessDenied)
  end
end
