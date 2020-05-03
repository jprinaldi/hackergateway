# frozen_string_literal: true

RSpec.describe "User visits FAQs page", type: :system do
  it "successfully" do
    faq = FactoryBot.create(:faq)
    visit faqs_path
    expect(page)
      .to have_current_path(faqs_path)
      .and have_content(faq.title)
  end
end
