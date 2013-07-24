require "spec_helper"

describe QrCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/qr_codes").should route_to("qr_codes#index")
    end

    it "routes to #new" do
      get("/qr_codes/new").should route_to("qr_codes#new")
    end

    it "routes to #show" do
      get("/qr_codes/1").should route_to("qr_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/qr_codes/1/edit").should route_to("qr_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/qr_codes").should route_to("qr_codes#create")
    end

    it "routes to #update" do
      put("/qr_codes/1").should route_to("qr_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/qr_codes/1").should route_to("qr_codes#destroy", :id => "1")
    end

  end
end
