# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Admin creates solution", type: :feature do
  before(:each) do
    admin = FactoryBot.create(:user, :confirmed, :admin)
    login_as(admin)
  end

  scenario "which already exists" do
    old_solution = FactoryBot.create(:solution)
    visit rails_admin.new_path(model_name: "solution")
    select old_solution.user.username, from: "User"
    select old_solution.challenge.name, from: "Challenge"
    click_button "Save"
    expect(page)
      .to have_current_path(rails_admin.new_path(model_name: "solution"))
    expect(page).to have_content("User has already solved this challenge")
  end

  scenario "successfully" do
    solution = FactoryBot.build(:solution)
    visit rails_admin.new_path(model_name: "solution")
    select solution.user.username, from: "User"
    select solution.challenge.name, from: "Challenge"
    click_button "Save"
    expect(page)
      .to have_current_path(rails_admin.index_path(model_name: "solution"))
    expect(page).to have_content("Solution successfully created")
  end
end
