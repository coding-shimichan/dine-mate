class Restaurant < ApplicationRecord
  has_many :wishlists, dependent: :destroy
  has_many :interested_users, through: :wishlists, source: :user

  scope :interested_users, ->(resutaurant_id) { find(resutaurant_id).users }
end
