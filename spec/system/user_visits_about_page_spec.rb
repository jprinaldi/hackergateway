# frozen_string_literal: true

RSpec.describe "User visits about page", type: :system do
  it "successfully" do
    visit about_path
    expect(page).to have_current_path(about_path)
  end
end
