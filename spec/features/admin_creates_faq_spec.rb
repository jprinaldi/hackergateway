# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Admin creates FAQ", type: :feature do
  before(:each) do
    admin = FactoryBot.create(:user, :confirmed, :admin)
    login_as(admin)
  end

  scenario "without a title" do
    faq = FactoryBot.build(:faq)
    visit rails_admin.new_path(model_name: "faq")
    fill_in "Answer", with: faq.answer
    click_button "Save"
    expect(page)
      .to have_current_path(rails_admin.new_path(model_name: "faq"))
    expect(page).to have_content("Faq failed to be created")
    expect(page).to have_content("Title can't be blank")
  end

  scenario "without an answer" do
    faq = FactoryBot.build(:faq)
    visit rails_admin.new_path(model_name: "faq")
    fill_in "Title", with: faq.title
    click_button "Save"
    expect(page)
      .to have_current_path(rails_admin.new_path(model_name: "faq"))
    expect(page).to have_content("Faq failed to be created")
    expect(page).to have_content("Answer can't be blank")
  end

  scenario "successfully" do
    faq = FactoryBot.build(:faq)
    visit rails_admin.new_path(model_name: "faq")
    fill_in "Title", with: faq.title
    fill_in "Answer", with: faq.answer
    click_button "Save"
    expect(page)
      .to have_current_path(rails_admin.index_path(model_name: "faq"))
    expect(page).to have_content("Faq successfully created")
  end
end
