class Admin::HikingsController < ApplicationController

  def index
    @hikings = Hiking.all
  end

  def new
    @hiking = Hiking.new
  end

  def create
    @hiking = Hiking.new(hiking_params)

    if @hiking.save
      flash[:notice] = "已成功新增路線"
      redirect_to admin_plans_path
    else
      flash[:alert] = @hiking.errors.full_messages.to_centence
      render :new
    end
  end

  private

  def hiking_params
    params.require(:hiking).permit(:name, :iamge, :level, :day, :miles, :intro)
  end

end
