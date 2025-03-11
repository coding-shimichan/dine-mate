require "rails_helper"

RSpec.describe "Restaurant management", type: :request do
  describe "Restaurant Read for noraml users" do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }
    let!(:wishlist) { FactoryBot.create(:wishlist, user_id: first_user.id, restaurant_id: restaurant.id) }

    context "Logged in as first_user, requests HTTP" do
      before do
        sign_in first_user
      end

      it "Can GET /restaurants/search" do
        get "/restaurants/search"
        expect(response).to have_http_status(:ok)
      end

      it "Can GET /restaurants/:id" do
        get "/restaurants/#{restaurant.id}"
        expect(response).to have_http_status(:ok)
      end
      
      it "Can GET /restaurants/:id/interested_users" do
        get "/restaurants/#{restaurant.id}/interested_users"
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "Logged in as first_user, requests JSON" do
      before do
        sign_in first_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /restaurants/search" do
        get "/restaurants/search", :headers => headers
        expect(response).to have_http_status(:ok)
      end

      it "Can GET /restaurants/:id" do
        get "/restaurants/#{restaurant.id}", :headers => headers
        expect(response).to have_http_status(:ok)
      end
      
      it "Can GET /restaurants/:id/interested_users" do
        get "/restaurants/#{restaurant.id}/interested_users", :headers => headers
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
