require "rails_helper"

RSpec.describe TrailsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trails").to route_to("trails#index")
    end

    it "routes to #new" do
      expect(:get => "/trails/new").to route_to("trails#new")
    end

    it "routes to #show" do
      expect(:get => "/trails/1").to route_to("trails#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trails/1/edit").to route_to("trails#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trails").to route_to("trails#create")
    end

    it "routes to #update" do
      expect(:put => "/trails/1").to route_to("trails#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trails/1").to route_to("trails#destroy", :id => "1")
    end

  end
end
