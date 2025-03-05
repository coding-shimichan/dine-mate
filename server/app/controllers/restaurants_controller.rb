class RestaurantsController < ApplicationController
  include ActiveModel::Attributes

  def search
    @restaurants = query_restaurants(params[:keyword])
  end

  def show
    existing_restaurant = Restaurant.find_by(internal_id: params[:id]) || Restaurant.from_api(params[:id])
    @restaurant = existing_restaurant
  end

  private

  def query_restaurants(keyword)
    api_executer = HotPepperApi.new
    response = api_executer.search_by_keyword(keyword)
    json = JSON.parse(response.body)

    shops_data = json.dig("results", "shop")
    return nil unless shops_data

    shops_data
  end

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id] || params[:restaurant_id]) || query_restaurant(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:id, :restaurant_id, :keyword)
  end
end
