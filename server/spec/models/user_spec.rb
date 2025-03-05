require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:wishlists) }
    it { should have_many(:restaurants) }
    it { should have_many(:chats) }
    it { should have_many(:messages) }
    it { should have_many(:memories) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
