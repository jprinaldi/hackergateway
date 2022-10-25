# frozen_string_literal: true

RSpec.describe "Categories" do
  subject { response }

  describe "GET /categories" do
    before do
      get categories_path
    end

    it { is_expected.to be_ok }
  end
end
