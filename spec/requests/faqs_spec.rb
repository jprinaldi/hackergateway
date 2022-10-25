# frozen_string_literal: true

RSpec.describe "Faqs" do
  subject { response }

  describe "GET /faqs" do
    before do
      get faqs_path
    end

    it { is_expected.to be_ok }
  end
end
