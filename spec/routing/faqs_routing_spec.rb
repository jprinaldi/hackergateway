require "rails_helper"

RSpec.describe FaqsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/faqs").to route_to("faqs#index")
    end
  end
end
