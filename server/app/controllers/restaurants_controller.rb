class RestaurantsController < ApplicationController
  include ActiveModel::Attributes
  def search
    if params[:keyword]
      keyword = params[:keyword].to_s.strip.gsub(/\u3000/, " ")
      @restaurants = query_restaurants(keyword)
    else
      # Do nothing
    end

    respond_to do |format|
      format.html { render :search, status: :ok }
      format.json { render json: @restaurants, status: :ok}
    end
  end

  def show
    @restaurant = Restaurant.find_or_fetch(params[:id])

    respond_to do |format|
      format.html { render :show, restaurant: @restaurant,  status: :ok }
      format.json { render json: @restaurant, status: :ok}
    end
  end

  def interested_users
    @restaurant = Restaurant.find_or_fetch(params[:restaurant_id])

    respond_to do |format|
      if @restaurant.interested_users.length > 0
        format.html { render :interested_users, restaurant: @restaurant,  status: :ok }
        format.json { render json: @restaurant, status: :ok}
      else
        format.html { redirect_to @restaurant, status: :no_content }
        format.json { header :no_content }
      end
    end
      
  end

  private

  def query_restaurants(keyword)
    if !keyword
       return nil;
    end
    
    api_executer = HotPepperApi.new
    response = api_executer.search_by_keyword(keyword)
    json = JSON.parse(response.body)

    shops_data = json.dig("results", "shop")
    return nil unless shops_data

    shops_data
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:id, :restaurant_id, :keyword)
  end
end
