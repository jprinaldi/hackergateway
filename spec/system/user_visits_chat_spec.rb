# frozen_string_literal: true

RSpec.describe "User visits chat", type: :system do
  it "successfully" do
    visit chat_path
    expect(page).to have_current_path(chat_path)
  end
end
