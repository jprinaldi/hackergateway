# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User visits category", type: :system do
  let(:challenge) { FactoryBot.create(:challenge) }

  before do
    visit category_path(challenge.category)
  end

  it "works" do
    expect(page)
      .to have_current_path(category_path(challenge.category))
      .and have_content(challenge.category.name)
      .and have_content(challenge.name)
  end
end
