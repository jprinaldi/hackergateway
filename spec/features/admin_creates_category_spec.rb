require "rails_helper"

RSpec.feature "Admin creates category", type: :feature do
  before(:each) do
    admin = FactoryBot.create(:user, :confirmed, :admin)
    login_as(admin)
  end

  scenario "with a non-unique name" do
    existing_category = FactoryBot.create(:category)
    visit rails_admin.new_path(model_name: "category")
    fill_in "Name", with: existing_category.name
    click_button "Save"
    expect(page).to have_current_path(
      rails_admin.new_path(model_name: "category")
    )
    expect(page).to have_content("Category failed to be created")
    expect(page).to have_content("Name has already been taken")
  end

  scenario "successfully" do
    category = FactoryBot.build(:category)
    visit rails_admin.new_path(model_name: "category")
    fill_in "Name", with: category.name
    click_button "Save"
    expect(page)
      .to have_current_path(rails_admin.index_path(model_name: "category"))
    expect(page).to have_content(category.name)
  end
end
