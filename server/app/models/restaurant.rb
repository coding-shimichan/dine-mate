class Restaurant < ApplicationRecord
  has_many :wishlists, dependent: :destroy
  has_many :interested_users, through: :wishlists, source: :user
  has_many :memories

  # scope :interested_users, ->(resutaurant_id) { find(resutaurant_id).users }

  def self.from_api(data)
    find_or_initialize_by(id: data["id"]).tap do |restaurant|
      restaurant.name = data["name"]
      # restaurant.address = data["address"]
      # restaurant.image_url = data.dig("photo", "pc", "l")  # Safely fetch nested data
      # restaurant.phone_number = data["tel"]
      restaurant.save if restaurant.new_record?  # Save only if it's a new record
    end
  end
end
