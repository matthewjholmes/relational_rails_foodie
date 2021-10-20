class ProducesController < ApplicationController

  def index
    @produces = Produce.seasonal_filter
  end

  def show
    @produce = Produce.find(params[:id])
  end

  def edit
    @produce = Produce.find(params[:id])
  end

  def update
    produce = Produce.find(params[:id])
    if produce.update(produce_params)
      redirect_to "/produces/#{produce.id}"
    else
      redirect_to "/produces/#{produce.id}/edit"
    end
  end

  def destroy
    produce = Produce.find(params[:id])
    produce.destroy
    redirect_to '/produces'
  end

  private

  def produce_params
    params.permit(:name, :seasonal, :quantity)
  end
end
