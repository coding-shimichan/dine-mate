require 'rails_helper'

RSpec.describe ChatUser, type: :model do
  describe "associations" do
    it { should belong_to(:chat) }
    it { should belong_to(:user) }
  end

  describe "Chat is restricted to have only two participants" do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    let!(:third_user) { FactoryBot.create(:third_user) }
    let!(:chat) { FactoryBot.create(:chat) }

    it "fails to create third participatns" do
      ChatUser.create!(chat_id: chat.id, user_id: first_user.id)
      ChatUser.create!(chat_id: chat.id, user_id: second_user.id)

      third_chat_user = ChatUser.new(chat_id: chat.id, user_id: third_user.id)
      expect(third_chat_user).not_to be_valid
      expect(third_chat_user.errors[:chat]).to include("can only have two participants")
    end
  end
end
