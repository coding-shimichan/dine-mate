class Restaurant < ApplicationRecord
  has_many :wishlists, dependent: :destroy
  has_many :interested_users, through: :wishlists, source: :user
  has_many :memories

  # scope :interested_users, ->(resutaurant_id) { find(resutaurant_id).users }

  def self.from_api(external_id)
    api_executer = HotPepperApi.new
    response = api_executer.search_by_restaurant_id(external_id)

    return nil unless response.success?

    data = JSON.parse(response.body).dig("results", "shop").first

    restaurant = Restaurant.find_or_create_by(internal_id: data["id"]) do |r|
      r.external_id = data["id"]
      r.payload = data
    end

    restaurant
  end
end
