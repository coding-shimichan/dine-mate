require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "associations" do
    it { should have_many(:wishlists) }
    it { should have_many(:interested_users) }
    it { should have_many(:memories) }
  end

  describe "validations" do
    it { should validate_presence_of(:internal_id) }
    it { should validate_presence_of(:external_id) }
  end

  describe "query and fetch" do
    let!(:restaurant) { FactoryBot.create(:restaurant) }

    it "Fetches existing retaurant" do
      result = Restaurant.find_or_fetch(restaurant.id)
      expect(result).to eq restaurant
    end
  end
end
