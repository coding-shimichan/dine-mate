# require "rails_helper"

# RSpec.describe "Restaurant management", type: :request do
#   describe "Restaurant CRUD for admins" do
#     let!(:admin_user) { FactoryBot.create(:admin_user) }
#     let!(:first_user) { FactoryBot.create(:first_user) }
#     let!(:restaurant) { FactoryBot.create(:restaurant) }
#     let!(:restaurant) { FactoryBot.create(:restaurant, {user_id: first_user.id, restaurant_id: restaurant.id}) }

#     context "Logged in as admin_user, requests HTTP" do
#       before do
#         sign_in admin_user
#       end

#       it "GET admin_restaurants" do
#         get "/admin/restaurants"
#         expect(response).to have_http_status(:success)
#       end
      
#       it "GET admin_restaurant" do
#         get "/admin/restaurants/#{restaurant.id}"
#         expect(response).to have_http_status(:success)
#       end

#       it "DELETE admin_restaurant" do
#         delete "/admin/restaurants/#{restaurant.id}"
#         expect(response).to have_http_status(:see_other)
#       end
#     end
    
#     context "Logged in as admin_user, requests JSON" do
#       before do
#         sign_in admin_user
#       end

#       headers = { "ACCEPT" => "application/json" }

#       it "GET admin_restaurants" do
#         get "/admin/restaurants", :headers => headers
#         json_response = JSON.parse(response.body)

#         expect(response).to have_http_status(:ok)
#         expect(json_response.length).to eq(Restaurant.all.length)
#       end
      
#       it "GET admin_restaurant" do
#         get "/admin/restaurants/#{restaurant.id}", :headers => headers
#         json_response = JSON.parse(response.body)

#         expect(response).to have_http_status(:ok)
#         expect(json_response["title"]).to eq(restaurant.title)
#         expect(json_response["content"]).to eq(restaurant.content)
#         expect(json_response["user_id"]).to eq(restaurant.user_id)
#         expect(json_response["restaurant_id"]).to eq(restaurant.restaurant_id)
#       end

#       it "DELETE admin_restaurant" do
#         delete "/admin/restaurants/#{restaurant.id}", :headers => headers
#         # json_response not available as response is empty

#         expect(response).to have_http_status(:no_content)
#       end
#     end
#   end
# end
