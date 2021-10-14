class ProducesController < ApplicationController

  def index
    @produces = Produce.all
  end

  def show
    @produce = Produce.find(params[:id])
  end
end
