require "rails_helper"

RSpec.describe SolutionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/solutions").to route_to("solutions#index")
    end
  end
end
