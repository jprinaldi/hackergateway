require 'rails_helper'

RSpec.describe "Solutions", type: :request do
  describe "GET /solutions" do
    it "works! (now write some real specs)" do
      get solutions_path
      expect(response).to have_http_status(200)
    end
  end
end
