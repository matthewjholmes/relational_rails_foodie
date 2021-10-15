class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order_by_most_recent_creation
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def create
    restaurant = Restaurant.create(rest_params)
    if restaurant.save
      redirect_to '/restaurants'
    else
      redirect_to '/restaurants/new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.find(params[:id])
    if restaurant.update(rest_params)
      redirect_to "/restaurants/#{restaurant.id}"
    else
      redirect_to "/restaurants/#{restaurant.id}/edit"
    end
  end

  private

  def rest_params
    params.permit(:name, :dine_in, :rating)
  end
end
