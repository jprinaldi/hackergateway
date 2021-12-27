# frozen_string_literal: true

RSpec.describe "User visits someone's profile", type: :system do
  subject { page }

  let(:user) { create(:user) }

  before { visit user_path(user) }

  it { is_expected.to have_current_path(user_path(user)) }

  it { is_expected.to have_content(user.username) }
end
