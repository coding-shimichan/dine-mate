require "rails_helper"

RSpec.describe "User management", type: :request do
  describe "User CRUD for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let(:first_user) { FactoryBot.create(:first_user) }

    context "Logged in as admin_user, requests HTTP" do
      before do
        sign_in admin_user
      end

      it "Can GET /admin/users" do
        get "/admin/users"
        expect(response).to have_http_status(:ok)
      end

      it "Can POST /admin/users" do
        post "/admin/users", :params => { user: { email: "second.user@aaa.com", password: "password", password_confirmation: "password", admin: false } }
        expect(response).to have_http_status(:created)
      end
      
      it "Can GET /admin/users/new" do
        get "/admin/users/new"
        expect(response).to have_http_status(:ok)
      end

      it "Can GET /admin/users/:id/edit for an admin user" do
        get "/admin/users/#{admin_user.id}/edit"
        expect(response).to have_http_status(:ok)
      end

      it "Can GET /admin/users/:id/edit for a normal user" do
        get "/admin/users/#{first_user.id}/edit"
        expect(response).to have_http_status(:ok)
      end

      it "Can PUT /admin/users/:id for an admin user" do
        put "/admin/users/#{admin_user.id}", :params => { user: {email: "admin.user2@aaa.com" } }
        expect(response).to have_http_status(:ok)
      end

      it "Can PUT /admin/users/:id for a normal user" do
        put "/admin/users/#{first_user.id}", :params => { user: {email: "first.user2@aaa.com" } }
        expect(response).to have_http_status(:ok)
      end

      it "DELETE /admin/users/:id for an admin user" do
        delete "/admin/users/#{admin_user.id}"
        expect(response).to have_http_status(:see_other)
      end
    end
    
    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /admin/users" do
        get "/admin/users", :headers => headers
        expect(response).to have_http_status(:ok)
      end

      it "Can POST /admin/users" do
        post "/admin/users", :params => { user: { email: "second.user@aaa.com", password: "password", password_confirmation: "password", admin: false } }, :headers => headers
        expect(response).to have_http_status(:created)
      end
      
      it "Can PUT /admin/users/:id for an admin user" do
        put "/admin/users/#{admin_user.id}", :params => { user: { email: "updated.admin@aaa.com" } }, :headers => headers
        expect(response).to have_http_status(:ok)
      end

      it "Can PUT /admin/users/:id for a normal user" do
        put "/admin/users/#{first_user.id}", :params => {user: { email: "updated.first@aaa.com" }}, :headers => headers
        expect(response).to have_http_status(:ok)
      end

      it "DELETE /admin/users/:id for an admin user" do
        delete "/admin/users/#{admin_user.id}", :headers => headers
        expect(response).to have_http_status(:no_content)
      end
    end
    
    context "Logged in as normal user, requests JSON" do
      before do
        sign_in first_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Cannot GET /admin/users" do
        get "/admin/users", :headers => headers
        expect(response).to have_http_status(:forbidden)
      end

      it "Can POST /admin/users" do
        post "/admin/users", :params => { user: { email: "second.user@aaa.com", password: "password", password_confirmation: "password", admin: false } }, :headers => headers
        expect(response).to have_http_status(:forbidden)
      end
      
      it "Can PUT /admin/users/:id for an admin user" do
        put "/admin/users/#{admin_user.id}", :params => { user: {email: "admin.user2@aaa.com" } }, :headers => headers
        expect(response).to have_http_status(:forbidden)
      end

      it "Can PUT /admin/users/:id for a normal user" do
        put "/admin/users/#{first_user.id}", :params => { user: {email: "first.user2@aaa.com" } }, :headers => headers
        expect(response).to have_http_status(:forbidden)
      end

      it "DELETE /admin/users/:id for an normal user" do
        delete "/admin/users/#{admin_user.id}", :headers => headers
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
