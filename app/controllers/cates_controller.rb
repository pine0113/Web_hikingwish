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
    @plans = Plan.where('numberofday_id < 4').limit(10)
  end

  def long
    @plans = Plan.where('numberofday_id > 4').limit(10)
  end

  def long
    @plans = Plan.where("day >= 6" ) 
  end

  private
  
    def set_cate
      @cate = Cate.find(params[:id])
    end
end
