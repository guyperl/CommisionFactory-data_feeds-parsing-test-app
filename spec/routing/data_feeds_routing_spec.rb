require "spec_helper"

describe DataFeedsController do
  describe "routing" do

    it "routes to #index" do
      get("/data_feeds").should route_to("data_feeds#index")
    end

    it "routes to #new" do
      get("/data_feeds/new").should route_to("data_feeds#new")
    end

    it "routes to #show" do
      get("/data_feeds/1").should route_to("data_feeds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/data_feeds/1/edit").should route_to("data_feeds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/data_feeds").should route_to("data_feeds#create")
    end

    it "routes to #update" do
      put("/data_feeds/1").should route_to("data_feeds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/data_feeds/1").should route_to("data_feeds#destroy", :id => "1")
    end

  end
end
