# frozen_string_literal: true

RSpec.describe "User visits FAQs page", type: :system do
  subject { page }

  let!(:faq) { FactoryBot.create(:faq) }

  before { visit faqs_path }

  it { is_expected.to have_current_path(faqs_path) }

  it { is_expected.to have_content(faq.title) }
end
