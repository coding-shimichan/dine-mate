require 'rails_helper'

RSpec.describe Memory, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:restaurant) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
