# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User visits about page", type: :system do
  scenario "successfully" do
    visit about_path
    expect(page).to have_current_path(about_path)
  end
end
