require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "associations" do
    it { should have_many(:wishlists) }
    it { should have_many(:interested_users) }
    it { should have_many(:memories) }
  end

end
