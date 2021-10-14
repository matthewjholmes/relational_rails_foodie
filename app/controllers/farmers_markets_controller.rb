class FarmersMarketsController < ApplicationController

  def index
    @farmers_markets = FarmersMarket.order_by_most_recent_creation
  end

  def show
    @farmers_market = FarmersMarket.find(params[:id])
  end

end
