class PagesController < ApplicationController

  def landing
    @short_plans = Plan.where('day < 2').limit(5)

    @easy_plans = Plan.where('level < 1').limit(5)

    @almost_plans = Plan.all.limit(5)

  end

  def about
  end

  def index
  end

  def hikings
  end
  
  def wishes
  end

  def wishes_empty
  end

  def wish_edit
  end

  def plans
  end

  def plans_empty
  end

  def plan_edit
  end

  def privacy
  end
  
end
