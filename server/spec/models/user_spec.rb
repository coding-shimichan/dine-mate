require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:wishlists) }
    it { should have_many(:restaurants) }
    it { should have_many(:chats) }
    it { should have_many(:messages) }
    it { should have_many(:memories) }
    it { should have_one_attached(:profile_photo) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    # it { should validate_uniqueness_of(:email) }
  end

  describe "profile_photo upload" do
    let!(:user) { FactoryBot.create(:first_user) }

    it "allows valid image formats" do
      user.profile_photo.attach(
        io: File.open(Rails.root.join("spec/fixtures/files/profile.jpg")),
        filename: "profile.jpg",
        content_type: "image/jpeg"
      )
      expect(user).to be_valid
    end

    it "rejects invalid image formats" do
      user.profile_photo.attach(
        io: File.open(Rails.root.join("spec/fixtures/files/sample.txt")),
        filename: "sample.txt",
        content_type: "text/plain"
      )
      expect(user).not_to be_valid
      expect(user.errors[:profile_photo]).to include("must be a JPEG or PNG")
    end

    it "rejects larger image" do
      user.profile_photo.attach(
        io: File.open(Rails.root.join("spec/fixtures/files/large_photo.jpg")),
        filename: "large_photo.jpg",
        content_type: "image/jpeg"
      )
      expect(user).not_to be_valid
      expect(user.errors[:profile_photo]).to include("must be less than 2MB")
    end
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
