class HikingsController < ApplicationController
  before_action :authenticate_user!, :only => [:add_to_wish, ]

  def index
    @hikings = Hiking.all
  end

  def show
    set_hiking
  end

  def plans
    set_hiking
    @plans = @hiking.plans
  end

  def add_to_wish
    set_hiking
    @wish = current_user.wishes.build
    @wish.name = @hiking.name
    if @wish.save
      flash[:notice] = '"wish was successfully created'
    else
      flash[:alert] = 'wish was failed to create'
    end
    redirect_to wishes_path
  end

  private

  def set_hiking
    @hiking = Hiking.find(params[:id])
  end
end
