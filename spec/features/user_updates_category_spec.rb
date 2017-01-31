require 'rails_helper'

RSpec.feature "User updates category", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    category = FactoryGirl.create(:category)
    new_category_name = "c4t3g0ry"
    login_as(user)
    visit edit_category_path(category)
    fill_in 'Name', with: new_category_name
    click_button 'Update'
    expect(page).to have_content(new_category_name)
    expect(page).not_to have_content(category.name)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    category = FactoryGirl.create(:category)
    login_as(user)
    expect {
      visit edit_category_path(category)
    }.to raise_error(CanCan::AccessDenied)
  end

  scenario "without signing in" do
    category = FactoryGirl.create(:category)
    expect {
      visit edit_category_path(category)
    }.to raise_error(CanCan::AccessDenied)
  end
end
