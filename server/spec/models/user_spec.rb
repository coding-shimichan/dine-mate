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
    # it { should validate_uniqueness_of(:email) }
  end

  describe "chats" do
    context "first_user and second_user have a chat" do
      let!(:first_user) { FactoryBot.create(:first_user) }
      let!(:second_user) { FactoryBot.create(:second_user) }
      let!(:third_user) { FactoryBot.create(:third_user) }
      let!(:chat) { FactoryBot.create(:chat) }

      it "first_user has a chat with second_user" do
        chat.users << first_user
        chat.users << second_user

        expect(first_user.chat_with?(second_user)).to be true
        expect(first_user.chat_with(second_user).id).to eq chat.id

        expect(second_user.chat_with?(first_user)).to be true
        expect(second_user.chat_with(first_user).id).to eq chat.id
      end

      it "first_user does not have a chat with third_user" do
        expect(first_user.chat_with?(third_user)). to be false
      end    
    end
  end
end
