# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User visits about page", type: :feature do
  scenario "successfully" do
    visit about_path
    expect(page).to have_current_path(about_path)
  end
end
