require "rails_helper"

RSpec.describe "Chat management", type: :request do
  describe "Chat CRUD for noraml users" do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }

    context "Logged in as first_user, requests HTTP" do
      before do
        sign_in first_user
      end

      it "GET /chats" do
        get "/chats"
        expect(response).to have_http_status(:ok)
      end

      it "POST /chats" do
        post "/chats", params: { user_id: second_user.id }
        expect(response).to have_http_status(:created)
      end
    end
  end
end
