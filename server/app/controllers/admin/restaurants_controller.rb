class Admin::RestaurantsController < ApplicationController
  include ActiveModel::Attributes

  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @restaurants, status: :ok }
    end
  end

  def show
    @restaurant = Restaurant.find_or_fetch(params[:id])

    respond_to do |format|
      format.html { render :show, restaurant: @restaurant,  status: :ok }
      format.json { render json: @restaurant, status: :ok}
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to admin_restaurants_path, notice: "Restaurant was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end 
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

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:id, :restaurant_id, :keyword)
  end
end
