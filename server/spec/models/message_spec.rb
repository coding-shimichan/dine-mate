require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:chat) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:chat_id) }
  end
end
