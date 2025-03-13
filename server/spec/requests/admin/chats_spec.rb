require "rails_helper"

RSpec.describe "Chat management", type: :request do
  describe "Chat management for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    let!(:chat) { FactoryBot.create(:chat) }
    let!(:first_chat_user) { FactoryBot.create(:chat_user, user_id: first_user.id, chat_id: chat.id) }
    let!(:second_chat_user) { FactoryBot.create(:chat_user, user_id: second_user.id, chat_id: chat.id) }

    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /admin/chats" do
        get "/admin/chats", :headers => headers
        expect(response).to have_http_status(:ok)

        chats = JSON.parse(response.body)
        expect(chats.length).to eq 1
        expect(chats[0]).to include(chat.as_json)
      end
      
      it "DELETE /admin/chats/:id" do
        expect(first_user.chats).to include(chat)

        delete "/admin/chats/#{chat.id}", :headers => headers
        expect(response).to have_http_status(:no_content)
        expect(first_user.chats).not_to include(chat)
      end
    end
  end
end
