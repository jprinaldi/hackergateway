# frozen_string_literal: true

RSpec.describe "Challenges" do
  subject { response }

  describe "GET /challenges" do
    before do
      get challenges_path
    end

    it { is_expected.to be_ok }
  end
end
