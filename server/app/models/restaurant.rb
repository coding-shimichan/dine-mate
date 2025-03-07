class Restaurant < ApplicationRecord
  has_many :wishlists, dependent: :destroy
  has_many :interested_users, through: :wishlists, source: :user
  has_many :memories

  validates :internal_id, presence: true
  validates :external_id, presence: true

  def self.find_or_fetch(id)
    find_by(internal_id: id) || from_api(id)
  end

  def self.from_api(external_id)
    api_executer = HotPepperApi.new
    response = api_executer.search_by_restaurant_id(external_id)

    return nil unless response.success?

    data = JSON.parse(response.body).dig("results", "shop").first

    create!(
      internal_id: data["id"],
      external_id: data["id"],
      payload: data
    )
  end
end
