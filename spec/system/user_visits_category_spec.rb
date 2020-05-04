# frozen_string_literal: true

RSpec.describe "User visits category", type: :system do
  subject { page }

  let(:challenge) { FactoryBot.create(:challenge) }

  before { visit category_path(challenge.category) }

  it { is_expected.to have_current_path(category_path(challenge.category)) }

  it { is_expected.to have_content(challenge.category.name) }

  it { is_expected.to have_content(challenge.name) }
end
