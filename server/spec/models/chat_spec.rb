require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe "associations" do
    let!(:chat) { FactoryBot.create(:chat) }
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    let!(:third_user) { FactoryBot.create(:third_user) }

    it { should have_many(:users) }
    it { should have_many(:messages) }

    it "cannot have third participants" do
      chat.users << first_user
      chat.users << second_user
      
      expect {
        chat.users << third_user
      }.to raise_error(ActiveRecord::RecordInvalid, /Chat can only have two participants/)
    end
  end
end
