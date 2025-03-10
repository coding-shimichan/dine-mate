
require "rails_helper"

RSpec.describe "Message management", type: :request do
  # Message posting is handled through channel

  # describe "Message CRUD for noraml users" do
  #   let!(:first_user) { FactoryBot.create(:first_user) }
  #   let!(:second_user) { FactoryBot.create(:second_user) }
  #   let!(:chat) { FactoryBot.create(:chat) }

  #   let!(:first_user_message) { FactoryBot.build(:message, {user_id: first_user.id, chat_id: chat.id}) }
  #   let!(:second_user_message) { FactoryBot.build(:message, {user_id: second_user.id, chat_id: chat.id}) }

  #   context "Logged in as first_user, requests HTTP" do
  #     before do
  #       sign_in first_user
  #     end

  #     it "POST chats/:id/messages" do
  #       post "/chats/#{chat.id}/messages", :params => { :message => { user_id: first_user.id, chat_id: chat.id, content: "Test message", is_read: false } }
  #       expect(response).to have_http_status(:created)
  #     end

  #     it "GET chats/:id/messages" do
  #       get "/chats/#{chat.id}/messages"
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
    
  #   context "Logged in as first_user, requests JSON" do
  #     before do
  #       sign_in first_user
  #     end

  #     headers = { "ACCEPT" => "application/json" }

  #     it "POST chat_messages" do
  #       post "/chats/#{chat.id}/messages", :params => { :message => { user_id: first_user.id, chat_id: chat.id, content: "Test message", is_read: false } }, :headers => headers
  #       json_response = JSON.parse(response.body)

  #       expect(response).to have_http_status(:created)
  #       expect(json_response["content"]).to eq("Test message")
  #       expect(json_response["user_id"]).to eq(first_user.id)
  #       expect(json_response["chat_id"]).to eq(chat.id)
  #       expect(json_response["is_read"]).to eq(false)
  #     end
  #   end
  # end
end
