require "rails_helper"

RSpec.describe "Wishlist management", type: :request do
  describe "Wishlist management for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }
    let!(:wishlist) { FactoryBot.create(:wishlist, {user_id: first_user.id, restaurant_id: restaurant.id}) }
    
    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /admin/wishlists" do
        get "/admin/wishlists", :headers => headers
        expect(response).to have_http_status(:ok)
        
        wishlists = JSON.parse(response.body)
        expect(wishlists.length).to eq 1
        expect(wishlists[0]).to include({ id: wishlist.id }.as_json)
      end
      
      it "DELETE /admin/wishlists/:id" do
        # wishlist exists at first
        expect(first_user.wishlists).to include(wishlist)

        # Request deletion of the wishlist
        delete "/admin/wishlists/#{wishlist.id}", :headers => headers

        # wishlist is deleted
        expect(response).to have_http_status(:no_content)
        expect(first_user.wishlists).not_to include(wishlist)
      end
    end
  end
end
