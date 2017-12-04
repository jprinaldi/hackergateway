# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User visits FAQs page", type: :system do
  scenario "successfully" do
    faq = FactoryBot.create(:faq)
    visit faqs_path
    expect(page)
      .to have_current_path(faqs_path)
      .and have_content(faq.title)
  end
end
