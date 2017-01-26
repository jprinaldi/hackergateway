require "rails_helper"

RSpec.describe SolutionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/solutions").to route_to("solutions#index")
    end

    it "routes to #new" do
      expect(:get => "/solutions/new").to route_to("solutions#new")
    end

    it "routes to #show" do
      expect(:get => "/solutions/1").to route_to("solutions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/solutions/1/edit").to route_to("solutions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/solutions").to route_to("solutions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/solutions/1").to route_to("solutions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/solutions/1").to route_to("solutions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/solutions/1").to route_to("solutions#destroy", :id => "1")
    end

  end
end
