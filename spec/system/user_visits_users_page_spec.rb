# frozen_string_literal: true

RSpec.describe "User visits users page", type: :system do
  subject { page }

  let!(:user) { FactoryBot.create(:user) }

  before { visit users_path }

  it { is_expected.to have_current_path(users_path) }

  it { is_expected.to have_content(user.username) }
end
