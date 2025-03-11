require 'rails_helper'

RSpec.describe ChatUser, type: :model do
  describe "associations" do
    it { should belong_to(:chat) }
    it { should belong_to(:user) }
  end
end
