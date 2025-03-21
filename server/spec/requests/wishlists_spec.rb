
require "rails_helper"

RSpec.describe "Wishlist management", type: :request do
  describe "Wishlist CRUD for noraml users" do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }
    let!(:wishlist) { FactoryBot.create(:wishlist, { user_id: first_user.id, restaurant_id: restaurant.id }) }
    let(:auth_token) do
      post "/users/tokens/sign_in", params: { email: first_user.email, password: "password" }
      JSON.parse(response.body)["token"]
    end
    let!(:headers) { { "ACCEPT" => "application/json", "Authorization" => "Bearer #{auth_token}" } }

    context "Logged in as first_user, requests JSON thorugh api resources routes" do
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
        expect(response).to have_http_status(:no_content) # json_response not available as response is empty
      end
    end
  end
end
