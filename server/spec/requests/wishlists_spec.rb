
require "rails_helper"

RSpec.describe "Wishlist management", type: :request do
  describe "Wishlist CRUD for noraml users" do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }
    let!(:wishlist) { FactoryBot.create(:wishlist, { user_id: first_user.id, restaurant_id: restaurant.id }) }

    context "Logged in as first_user, requests JSON thorugh api resources routes" do
      before do
        sign_in first_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "POST wishlists" do
        post "/api/wishlists", :params => { restaurant_id: restaurant.internal_id, user_id: first_user.id }, :headers => headers
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:created)
        expect(json_response["restaurant_id"]).to eq(restaurant.internal_id)
        expect(json_response["user_id"]).to eq(first_user.id)
      end

      it "GET user_wishlists" do
        get "/users/#{first_user.id}/wishlists", :headers => headers
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response.length).to eq(first_user.wishlists.length)
      end
      
      it "DELETE wishlist" do
        delete "/api/wishlists/#{wishlist.id}", :headers => headers
        # json_response not available as response is empty

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
