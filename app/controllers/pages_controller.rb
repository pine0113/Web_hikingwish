class PagesController < ApplicationController
  layout "landing", only: :landing
  def landing
    @wish = Wish.new
    @short_plans = Plan.where('day < 2').limit(5)

    @easy_plans = Plan.where('level < 1').limit(5)

    @almost_plans = Plan.all.limit(5)

  end

  def about
  end

  def privacy
  end

end
