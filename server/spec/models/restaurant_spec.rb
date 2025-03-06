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
    # TODO: Test Restaurant.from_api
  end
end
