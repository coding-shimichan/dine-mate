require "rails_helper"

RSpec.describe "Chat management", type: :request do
  describe "Chat CRUD for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    let!(:chat) { FactoryBot.create(:chat) }

    context "Logged in as admin_user, requests HTTP" do
      before do
        sign_in admin_user
      end

      it "Can GET /admin/chats" do
        chat.users << first_user
        chat.users << second_user
        chat.save
        get "/admin/chats"
        expect(response).to have_http_status(:ok)
      end
      
      it "DELETE /admin/chats/:id" do
        chat.users << first_user
        chat.users << second_user
        chat.save
        delete "/admin/chats/#{chat.id}"
        expect(response).to have_http_status(:see_other)
      end
    end
    
    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /admin/chats" do
        chat.users << first_user
        chat.users << second_user
        chat.save
        get "/admin/chats", :headers => headers
        expect(response).to have_http_status(:ok)
      end
      
      it "DELETE /admin/chats/:id" do
        chat.users << first_user
        chat.users << second_user
        chat.save
        delete "/admin/chats/#{chat.id}", :headers => headers
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
