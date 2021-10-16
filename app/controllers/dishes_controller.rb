class DishesController < ApplicationController

  def index
    @dishes = Dish.seasonal_filter
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    dish = Dish.find(params[:id])
    if dish.update(dish_params)
      redirect_to "/dishes/#{dish.id}"
    else
      redirect_to "/dishes/#{dish.id}/edit"
    end
  end

  private

  def dish_params
    params.permit(:name, :seasonal, :calories)
  end
end
