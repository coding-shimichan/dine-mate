class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show interested_users ]

  def search
  end

  def show
  end

  def interested_users
    @users = @restaurant.interested_users
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id] || params[:restaurant_id])
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:id, :restaurant_id)
  end
end
