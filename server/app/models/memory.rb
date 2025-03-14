class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :title, presence: true
  validates :content, presence: true
end
