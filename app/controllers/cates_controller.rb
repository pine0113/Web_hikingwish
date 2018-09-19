class CatesController < ApplicationController
  before_action :set_cate, :only => [:list]

  def list
    @hikings = @cate.hikings
  end

  def newbie
    @plans = Plan.where(level: 1)
    #@plans = @plansall.find_by_level(1) 只會找一個物件出來
  end

  def short
    @plans = Plan.where(day: 1 ) + Plan.where(day: 2 )
  end

  def overnight
    @plans = Plan.where(day: 3 ) + Plan.where(day: 4 ) + Plan.where(day: 5 ) 
  end

  def long
    @plans = Plan.where("day >= 6" ) 
  end

  private
  
    def set_cate
      @cate = Cate.find(params[:id])
    end
end
