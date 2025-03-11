require "rails_helper"

RSpec.describe "Wishlist management", type: :request do
  describe "Wishlist CRUD for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }
    let!(:wishlist) { FactoryBot.create(:wishlist, {user_id: first_user.id, restaurant_id: restaurant.id}) }

    context "Logged in as admin_user, requests HTTP" do
      before do
        sign_in admin_user
      end

      it "Can GET /admin/wishlists" do
        get "/admin/wishlists"
        expect(response).to have_http_status(:ok)
      end
      
      it "DELETE /admin/wishlists/:id" do
        wishlist.save
        delete "/admin/wishlists/#{wishlist.id}"
        expect(response).to have_http_status(:see_other)
      end
    end
    
    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /admin/wishlists" do
        get "/admin/wishlists", :headers => headers
        expect(response).to have_http_status(:ok)
      end
      
      it "DELETE /admin/wishlists/:id" do
        wishlist.save
        delete "/admin/wishlists/#{wishlist.id}", :headers => headers
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
