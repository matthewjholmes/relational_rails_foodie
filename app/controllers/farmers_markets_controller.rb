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

  private

  def fm_params
    params.permit(:name, :local, :vendor_count)
  end
end
