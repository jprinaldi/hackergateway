require "rails_helper"

RSpec.describe ChallengesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenges").to route_to("challenges#index")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1").to route_to("challenges#show", :id => "1")
    end

  end
end
