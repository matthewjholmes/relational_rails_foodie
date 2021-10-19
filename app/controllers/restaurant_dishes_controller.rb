class RestaurantDishesController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    if params[:sort]
      @dishes = @restaurant.alphabetical_dishes
    elsif params[:calories]
      @dishes = @restaurant.calories_filter(params[:calories])
    else
      @dishes = @restaurant.dishes
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    rest_dish = Dish.create(rest_dish_params)
    if rest_dish.save
      redirect_to "/restaurants/#{restaurant.id}/dishes"
    else
      redirect_to "/restaurants/#{restaurant.id}/dishes/new"
    end
  end

  private

  def rest_dish_params
    params.permit(:name, :seasonal, :calories, :restaurant_id)
  end
end
