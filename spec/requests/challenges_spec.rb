# frozen_string_literal: true

RSpec.describe "Challenges", type: :request do
  describe "GET /challenges" do
    it "works! (now write some real specs)" do
      get challenges_path
      expect(response).to have_http_status(:ok)
    end
  end
end
