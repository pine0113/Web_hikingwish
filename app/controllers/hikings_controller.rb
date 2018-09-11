class HikingsController < ApplicationController

  def index
    @hikings = Hiking.all
  end

  def show
  end

  def plans
  end

  def wishes
  end

end
