# frozen_string_literal: true

RSpec.describe "Solutions", type: :request do
  subject { response }

  describe "GET /solutions" do
    before do
      get solutions_path
    end

    it { is_expected.to be_ok }
  end
end
