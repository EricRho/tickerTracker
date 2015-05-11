class StocksController < ApplicationController
  respond_to :json

  def index
    respond_with Stock.all
  end

  def destroy
    respond_with Stock.destroy(params[:id])
  end

  def create
    respond_with Stock.create(stock_params)
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :name, :ask, :bid, :change, :change_in_percent)
  end

end
