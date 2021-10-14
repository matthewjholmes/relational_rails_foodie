class ProducesController < ApplicationController

  def index
    @produces = Produce.all
  end
end
