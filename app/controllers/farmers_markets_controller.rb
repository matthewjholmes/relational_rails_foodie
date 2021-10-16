class FarmersMarketsController < ApplicationController

  def index
    @farmers_markets = FarmersMarket.order_by_most_recent_creation
  end

  def show
    @farmers_market = FarmersMarket.find(params[:id])
  end

  def new
  end

  def create
    fm = FarmersMarket.create(fm_params)
    if fm.save
      redirect_to '/farmers_markets'
    else
      redirect_to '/farmers_markets/new'
    end
  end

  def edit
    @farmers_market = FarmersMarket.find(params[:id])
  end

  def update
    farmers_market = FarmersMarket.find(params[:id])
    if farmers_market.update(fm_params)
      redirect_to "/farmers_markets/#{farmers_market.id}"
    else
      redirect_to "/farmers_markets/#{farmers_market.id}/edit"
    end
  end

  def destroy
    fm = FarmersMarket.find(params[:id])
    fm.destroy
    redirect_to "/farmers_markets"
  end

  private

  def fm_params
    params.permit(:name, :local, :vendor_count)
  end
end
