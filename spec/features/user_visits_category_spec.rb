require "rails_helper"

RSpec.feature "User visits category", type: :feature do
  scenario "successfully" do
    challenge = FactoryGirl.create(:challenge)
    visit category_path(challenge.category)
    expect(page)
      .to have_current_path(category_path(challenge.category))
      .and have_content(challenge.category.name)
      .and have_content(challenge.name)
  end
end
