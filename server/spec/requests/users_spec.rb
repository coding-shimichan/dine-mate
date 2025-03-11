require "rails_helper"

RSpec.describe "User management", type: :request do
  describe "User CRUD for noraml users" do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }

    context "Logged in as first_user, requests HTTP" do
      before do
        sign_in first_user
      end

      it "No such page: GET /users" do
        get "/users"
        expect(response).to have_http_status(:not_found)
      end

      it "Can GET /users/:id for self" do
        get "/users/#{first_user.id}"
        expect(response).to have_http_status(:ok)
      end

      it "Can GET /users/:id for other user" do
        get "/users/#{second_user.id}"
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "Logged in as first_user, requests JSON" do
      before do
        sign_in first_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "No such page: GET /users" do
        get "/users", :headers => headers
        expect(response).to have_http_status(:not_found)
      end

      it "Can GET /users/:id for self" do
        get "/users/#{first_user.id}", :headers => headers
        expect(response).to have_http_status(:ok)
      end

      it "Can GET /users/:id for other user" do
        get "/users/#{second_user.id}", :headers => headers
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
