require "rails_helper"

RSpec.describe "Memory management", type: :request do
  describe "Memory management for admins" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }
    let!(:first_memory) { FactoryBot.create(:memory, {user_id: first_user.id, restaurant_id: restaurant.id}) }
    let!(:second_memory) { FactoryBot.create(:memory, {user_id: second_user.id, restaurant_id: restaurant.id}) }

    context "Logged in as admin_user, requests JSON" do
      before do
        sign_in admin_user
      end

      headers = { "ACCEPT" => "application/json" }

      it "Can GET /admin/memories" do
        get "/admin/memories", :headers => headers
        expect(response).to have_http_status(:ok)
        
        memories = JSON.parse(response.body)
        expect(memories.length).to eq 2
        expect(memories[0]).to include(first_memory.as_json)
        expect(memories[1]).to include(second_memory.as_json)
      end
      
      it "Can GET /admin/memories/:id" do
        get "/admin/memories/#{first_memory.id}", :headers => headers
        expect(response).to have_http_status(:ok)
        
        memory = JSON.parse(response.body)
        expect(memory).to include(first_memory.as_json)
      end
      
      it "DELETE /admin/memories/:id" do
        # memory exists at first
        expect(first_user.memories).to include(first_memory)

        # Request deletion of the memory
        delete "/admin/memories/#{first_memory.id}", :headers => headers

        # memory is deleted
        expect(response).to have_http_status(:no_content)
        expect(first_user.wishlists).not_to include(first_memory)
      end
    end
  end
end
