require "rails_helper"

RSpec.describe "Restaurant management", type: :request do
  describe "Restaurant CRUD for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }

    context "Logged in as admin_user, requests HTTP" do
      before do
        sign_in admin_user
      end

      it "GET /admin/restaurants" do
        get "/admin/restaurants"
        expect(response).to have_http_status(:ok)
      end
      
      it "GET /admin/restaurant/:id" do
        get "/admin/restaurants/#{restaurant.id}"
        expect(response).to have_http_status(:ok)
      end

      it "DELETE /admin/restaurant/:id" do
        delete "/admin/restaurants/#{restaurant.id}"
        expect(response).to have_http_status(:see_other)
      end
    end
    
    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "GET /admin/restaurants" do
        get "/admin/restaurants", :headers => headers
        expect(response).to have_http_status(:ok)
      end
      
      it "GET /admin/restaurant/:id" do
        get "/admin/restaurants/#{restaurant.id}", :headers => headers
        expect(response).to have_http_status(:ok)
      end

      it "DELETE /admin/restaurant/:id" do
        delete "/admin/restaurants/#{restaurant.id}", :headers => headers
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
