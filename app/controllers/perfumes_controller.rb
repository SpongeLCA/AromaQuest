class PerfumesController < ApplicationController

  def index
    @perfumes = Perfume.all
  end

  def show
    @perfume = Perfume.find(params[:id])
  end
end