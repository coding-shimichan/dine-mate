require "rails_helper"

RSpec.describe "Message management", type: :request do
  describe "Message CRUD for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    let!(:chat) { FactoryBot.create(:chat) }
    let!(:first_chat_user) { FactoryBot.create(:chat_user, user_id: first_user.id, chat_id: chat.id) }
    let!(:second_chat_user) { FactoryBot.create(:chat_user, user_id: second_user.id, chat_id: chat.id) }
    let!(:message) { FactoryBot.create(:message, {user_id: first_user.id, chat_id: chat.id}) }

    context "Logged in as admin_user, requests HTTP" do
      before do
        sign_in admin_user
      end

      it "Can GET /admin/chats/:id/messages" do
        get "/admin/chats/#{chat.id}/messages"
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /admin/chats/:id/messages" do
        get "/admin/chats/#{chat.id}/messages", :headers => headers
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
