# frozen_string_literal: true

RSpec.describe "User visits users page", type: :system do
  it "successfully" do
    user = FactoryBot.create(:user)
    visit users_path
    expect(page)
      .to have_current_path(users_path)
      .and have_content(user.username)
  end
end
