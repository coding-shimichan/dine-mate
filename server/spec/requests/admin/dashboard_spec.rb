require 'rails_helper'

RSpec.describe "Admin::Dashboards", type: :request do
  describe "Admin dashboard" do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:normal_user) { FactoryBot.create(:first_user) }
    
    context "Logged in as admin" do
      before do
        sign_in admin_user
      end

      it "GET /admin/dashboard" do
        get "/admin/dashboard"
        expect(response).to have_http_status(:success)
      end
    end

    context "Logged in as normal user" do
      before do
        sign_in normal_user
      end

      it "GET /admin/dashboard" do
        get "/admin/dashboard"
        expect(response).to have_http_status(:forbidden)
      end
    end
  
  end
end
