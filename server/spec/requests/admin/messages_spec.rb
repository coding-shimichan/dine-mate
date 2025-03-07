# require "rails_helper"

# RSpec.describe "Message management", type: :request do
#   describe "Message CRUD for admins" do
#     let!(:admin_user) { FactoryBot.create(:admin_user) }
#     let!(:first_user) { FactoryBot.create(:first_user) }
#     let!(:restaurant) { FactoryBot.create(:restaurant) }
#     let!(:message) { FactoryBot.create(:message, {user_id: first_user.id, restaurant_id: restaurant.id}) }

#     context "Logged in as admin_user, requests HTTP" do
#       before do
#         sign_in admin_user
#       end

#       it "GET admin_messages" do
#         get "/admin/messages"
#         expect(response).to have_http_status(:success)
#       end
      
#       it "GET admin_message" do
#         get "/admin/messages/#{message.id}"
#         expect(response).to have_http_status(:success)
#       end

#       it "DELETE admin_message" do
#         delete "/admin/messages/#{message.id}"
#         expect(response).to have_http_status(:see_other)
#       end
#     end
    
#     context "Logged in as admin_user, requests JSON" do
#       before do
#         sign_in admin_user
#       end

#       headers = { "ACCEPT" => "application/json" }

#       it "GET admin_messages" do
#         get "/admin/messages", :headers => headers
#         json_response = JSON.parse(response.body)

#         expect(response).to have_http_status(:ok)
#         expect(json_response.length).to eq(Message.all.length)
#       end
      
#       it "GET admin_message" do
#         get "/admin/messages/#{message.id}", :headers => headers
#         json_response = JSON.parse(response.body)

#         expect(response).to have_http_status(:ok)
#         expect(json_response["title"]).to eq(message.title)
#         expect(json_response["content"]).to eq(message.content)
#         expect(json_response["user_id"]).to eq(message.user_id)
#         expect(json_response["restaurant_id"]).to eq(message.restaurant_id)
#       end

#       it "DELETE admin_message" do
#         delete "/admin/messages/#{message.id}", :headers => headers
#         # json_response not available as response is empty

#         expect(response).to have_http_status(:no_content)
#       end
#     end
#   end
# end
