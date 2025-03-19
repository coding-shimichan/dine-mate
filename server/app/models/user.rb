class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable,
         :api

  has_many :wishlists, dependent: :destroy
  has_many :restaurants, through: :wishlists
  has_many :memories, dependent: :destroy
  has_many :chat_users, dependent: :destroy
  has_many :chats, through: :chat_users
  has_many :messages
  has_one_attached :profile_photo

  # validations for columns except profile_photo
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  # validations for profile_photo
  validate :correct_image_type, :acceptable_image_size

  def admin?
    admin
  end

  def chat_with?(other_user)
    chats.joins(:users).where(users: { id: other_user.id }).exists?
  end

  def chat_with(other_user)
    chats.joins(:users).where(users: { id: other_user.id }).distinct.first
  end

  private

  def correct_image_type
    if profile_photo.attached? && !profile_photo.content_type.in?(%w[image/jpeg image/png])
      errors.add(:profile_photo, "must be a JPEG or PNG")
    end
  end

  def acceptable_image_size
    if profile_photo.attached? && profile_photo.blob.byte_size > 2.megabytes
      errors.add(:profile_photo, "must be less than 2MB")
    end
  end
end
