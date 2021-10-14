class FarmersMarketProducesController < ApplicationController
  def index
    @farmers_market = FarmersMarket.find(params[:farmers_market_id])
    @produces = @farmers_market.produces
  end
end