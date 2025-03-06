require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe "associations" do
    it { should have_many(:users) }
    it { should have_many(:messages) }
    # TODO: A chat must have only two users
  end
end
