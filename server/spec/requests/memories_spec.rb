require "rails_helper"

RSpec.describe "Memory management", type: :request do
  describe "Memory CRUD for noraml users" do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let(:second_user) { FactoryBot.create(:second_user) }
    let!(:restaurant) { FactoryBot.create(:restaurant) }
    let!(:memory) { FactoryBot.create(:memory, {user_id: first_user.id, restaurant_id: restaurant.id}) }
    let(:other_memory) { FactoryBot.create(:memory, {user_id: second_user.id, restaurant_id: restaurant.id}) }
    let(:auth_token) do
      post "/users/tokens/sign_in", params: { email: first_user.email, password: "password" }
      JSON.parse(response.body)["token"]
    end
    let!(:headers) { { "ACCEPT" => "application/json", "Authorization" => "Bearer #{auth_token}" } }

    context "Logged in as first_user, requests JSON, through resources routes" do

      it "GET user_memories" do
        get "/users/#{first_user.id}/memories", :headers => headers
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response.length).to eq(first_user.memories.length)
      end
    end

    context "Logged in as first_user, requests JSON, through api resources routes" do
      it "GET user_memories" do
        get "/users/#{first_user.id}/memories", :headers => headers
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response.length).to eq(first_user.memories.length)
      end
      
      it "GET memory" do
        get "/api/memories/#{memory.id}", :headers => headers
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response["title"]).to eq(memory.title)
        expect(json_response["content"]).to eq(memory.content)
        expect(json_response["user_id"]).to eq(memory.user_id)
        expect(json_response["restaurant_id"]).to eq(memory.restaurant_id)
      end

      it "POST memory" do
        post "/api/memories", :params => { :memory => { title: "Great Dinner", content: "Had an amazing steak!", user_id: first_user.id, restaurant_id: restaurant.internal_id } }, :headers => headers
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:created)
        expect(json_response["title"]).to eq("Great Dinner")
        expect(json_response["content"]).to eq("Had an amazing steak!")
        expect(json_response["restaurant_id"]).to eq(restaurant.internal_id)
      end

      it "PUT memory" do
        put "/api/memories/#{memory.id}", :params => { :memory => { title: "Test 2" } }, :headers => headers
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json_response["title"]).to eq("Test 2")
        expect(json_response["content"]).to eq(memory.content)
        expect(json_response["user_id"]).to eq(memory.user_id)
        expect(json_response["restaurant_id"]).to eq(memory.restaurant_id)
      end

      it "DELETE memory create by first_user" do
        delete "/api/memories/#{memory.id}", :headers => headers
        expect(response).to have_http_status(:no_content) # json_response not available as response is empty
      end

      it "Cannot DELETE memory create by other_user" do
        delete "/api/memories/#{other_memory.id}", :headers => headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
