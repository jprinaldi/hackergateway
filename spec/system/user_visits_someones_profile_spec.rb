# frozen_string_literal: true

RSpec.describe "User visits someone's profile", type: :system do
  it "successfully" do
    user = FactoryBot.create(:user)
    visit user_path(user)
    expect(page)
      .to have_current_path(user_path(user))
      .and have_content(user.username)
  end
end
