require "rails_helper"

RSpec.describe "Restaurant management", type: :request do
  describe "Restaurant management for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:first_restaurant) { FactoryBot.create(:restaurant) }
    let!(:second_restaurant) { FactoryBot.create(:restaurant, internal_id: "J0002222", external_id: "J0002222", payload: { "id": "J0002222", "name": "second_restaurant"}) }

    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "GET /admin/restaurants" do
        get "/admin/restaurants", :headers => headers
        expect(response).to have_http_status(:ok)

        restaurants = JSON.parse(response.body)
        expect(restaurants.length).to eq 2
        expect(restaurants).to include(first_restaurant.as_json)
        expect(restaurants).to include(second_restaurant.as_json)
      end
      
      it "GET /admin/restaurants/:id" do
        get "/admin/restaurants/#{first_restaurant.id}", :headers => headers
        expect(response).to have_http_status(:ok)

        restaurant = JSON.parse(response.body)
        expect(restaurant).to include(first_restaurant.as_json)
      end

      it "DELETE /admin/restaurants/:id" do
        expect {
          delete "/admin/restaurants/#{first_restaurant.id}", :headers => headers
        }.to change(Restaurant, :count).by(-1)
      end
        
      it "Get no_content response after DELETE /admin/restaurants/:id" do
        delete "/admin/restaurants/#{first_restaurant.id}", :headers => headers
        expect(response).to have_http_status(:no_content)
      end

      it "Get nil by Restaurant.find_by(:id) after DELETE /admin/restaurants/:id" do
        delete "/admin/restaurants/#{first_restaurant.id}", :headers => headers
        expect(Restaurant.find_by(internal_id: first_restaurant.id)).to be_nil
      end
    end
  end
end
