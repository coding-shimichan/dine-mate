require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:restaurant) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:restaurant_id) }
  end
end
