# frozen_string_literal: true

RSpec.describe "User visits category" do
  subject { page }

  let(:challenge) { create(:challenge) }

  before { visit category_path(challenge.category) }

  it { is_expected.to have_current_path(category_path(challenge.category)) }

  it { is_expected.to have_content(challenge.category.name) }

  it { is_expected.to have_content(challenge.name) }
end
