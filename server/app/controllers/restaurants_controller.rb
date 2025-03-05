require "httparty"

class RestaurantsController < ApplicationController
  include ActiveModel::Attributes

  before_action :set_restaurant, only: %i[ show interested_users ]

  def search
    # API request send
    # exec search if query parameters exist
    @restaurants = query_restaurants(params[:keyword])
  end

  def show
  end

  def interested_users
    @users = @restaurant.interested_users
  end

  private

  def query_restaurants(keyword)
    api_executer = HotPepperApi.new
    api_executer.gourmet("サイゼリヤ 三宮")
    url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{Rails.application.credentials.Hot_Pepper_API_key}&format=json"
    query_string = URI.encode_www_form([["keyword", keyword]])
    response = HTTParty.get(url + "&" + query_string)
    json = JSON.parse(response.body)
    json["results"]["shop"]

    shops_data = json.dig("results", "shop")
    return nil unless shops_data

    shops_data
  end

  def query_restaurant(id)
    url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{Rails.application.credentials.Hot_Pepper_API_key}&format=json"
    query_string = URI.encode_www_form([["id", id]])
    response = HTTParty.get(url + "&" + query_string)
    json = JSON.parse(response.body)
  
    shop_data = json.dig("results", "shop", 0)
    return nil unless shop_data
  
    # Add to retaurants table
    Restaurant.from_api(shop_data)
  end

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id] || params[:restaurant_id]) || query_restaurant(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:id, :restaurant_id, :keyword)
  end
end
