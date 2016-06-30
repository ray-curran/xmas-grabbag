class PairsController < ApplicationController
  def index
    render json: Pair.all
  end
end