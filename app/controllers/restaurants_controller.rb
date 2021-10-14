class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order_by_most_recent_creation
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
