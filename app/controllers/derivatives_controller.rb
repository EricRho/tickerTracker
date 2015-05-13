class DerivativesController < ApplicationController
  respond_to :json

  def index
    response = Derivative.where('name like ?', "%#{params[:q]}%").map { |x| {id: x.id, text: x.name, symbol: x.symbol}}
    respond_with response
  end
end
