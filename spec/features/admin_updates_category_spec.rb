require "rails_helper"

RSpec.feature "Admin updates category", type: :feature do
  before(:each) do
    admin = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(admin)
  end

  scenario "with a non-unique name" do
    other_category = FactoryGirl.create(:category)
    current_category = FactoryGirl.create(:category)
    visit rails_admin.edit_path(model_name: "category", id: current_category.id)
    fill_in "Name", with: other_category.name
    click_button "Save"
    expect(page).to have_current_path(
      rails_admin.edit_path(model_name: "category", id: current_category.id)
    )
    expect(page).not_to have_content(other_category.name)
    expect(page).to have_content("Category failed to be updated")
    expect(page).to have_content("Name has already been taken")
    expect(page).to have_content(current_category.name)
  end

  scenario "successfully" do
    category = FactoryGirl.create(:category)
    new_category_name = "c4t3g0ry"
    visit rails_admin.edit_path(model_name: "category", id: category.id)
    fill_in "Name", with: new_category_name
    click_button "Save"
    expect(page).to have_current_path(
      rails_admin.index_path(model_name: "category")
    )
    expect(page).not_to have_content(category.name)
    expect(page).to have_content(new_category_name)
  end
end
