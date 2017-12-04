# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User visits category", type: :system do
  scenario "successfully" do
    challenge = FactoryBot.create(:challenge)
    visit category_path(challenge.category)
    expect(page)
      .to have_current_path(category_path(challenge.category))
      .and have_content(challenge.category.name)
      .and have_content(challenge.name)
  end
end
