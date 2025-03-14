class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many_attached :images, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
