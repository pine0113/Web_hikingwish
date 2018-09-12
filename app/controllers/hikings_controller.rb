class HikingsController < ApplicationController

  def index
    @hikings = Hiking.all
  end

  def show
    @hiking = Hiking.find(params[:id])
  end

  def plans
  end

  def wishes
  end

end
