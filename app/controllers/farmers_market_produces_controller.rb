class FarmersMarketProducesController < ApplicationController
  def index
    @farmers_market = FarmersMarket.find(params[:farmers_market_id])
    if params[:sort] == 'alphabetical'
      @produces = @farmers_market.alphabetical_produces
    else
      @produces = @farmers_market.produces
    end
  end

  def new
    @farmers_market = FarmersMarket.find(params[:farmers_market_id])
  end

  def create
    farmers_market = FarmersMarket.find(params[:farmers_market_id])
    fm_produce = Produce.create(fm_produce_params)
    if fm_produce.save
      redirect_to "/farmers_markets/#{farmers_market.id}/produces"
    else
      redirect_to "/farmers_markets/#{farmers_market.id}/produces/new"
    end
  end

  private

  def fm_produce_params
    params.permit(:name, :seasonal, :quantity, :farmers_market_id)
  end
end
