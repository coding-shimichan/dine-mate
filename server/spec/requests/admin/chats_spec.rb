# require "rails_helper"

# RSpec.describe "Chat management", type: :request do
#   describe "Chat CRUD for admins" do
#     let!(:admin_user) { FactoryBot.create(:admin_user) }
#     let!(:first_user) { FactoryBot.create(:first_user) }
#     let!(:restaurant) { FactoryBot.create(:restaurant) }
#     let!(:chat) { FactoryBot.create(:chat, {user_id: first_user.id, restaurant_id: restaurant.id}) }

#     context "Logged in as admin_user, requests HTTP" do
#       before do
#         sign_in admin_user
#       end

#       it "GET admin_chats" do
#         get "/admin/chats"
#         expect(response).to have_http_status(:success)
#       end
      
#       it "GET admin_chat" do
#         get "/admin/chats/#{chat.id}"
#         expect(response).to have_http_status(:success)
#       end

#       it "DELETE admin_chat" do
#         delete "/admin/chats/#{chat.id}"
#         expect(response).to have_http_status(:see_other)
#       end
#     end
    
#     context "Logged in as admin_user, requests JSON" do
#       before do
#         sign_in admin_user
#       end

#       headers = { "ACCEPT" => "application/json" }

#       it "GET admin_chats" do
#         get "/admin/chats", :headers => headers
#         json_response = JSON.parse(response.body)

#         expect(response).to have_http_status(:ok)
#         expect(json_response.length).to eq(Chat.all.length)
#       end
      
#       it "GET admin_chat" do
#         get "/admin/chats/#{chat.id}", :headers => headers
#         json_response = JSON.parse(response.body)

#         expect(response).to have_http_status(:ok)
#         expect(json_response["title"]).to eq(chat.title)
#         expect(json_response["content"]).to eq(chat.content)
#         expect(json_response["user_id"]).to eq(chat.user_id)
#         expect(json_response["restaurant_id"]).to eq(chat.restaurant_id)
#       end

#       it "DELETE admin_chat" do
#         delete "/admin/chats/#{chat.id}", :headers => headers
#         # json_response not available as response is empty

#         expect(response).to have_http_status(:no_content)
#       end
#     end
#   end
# end
