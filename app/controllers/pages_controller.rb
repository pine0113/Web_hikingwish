class PagesController < ApplicationController
  layout "landing", only: :landing
  before_action :page_params, :authenticate_user!, :only => [:create]

  def landing
    @page = Page.new
    @short_plans = Plan.where('numberofday_id < 4').limit(5)

    @easy_plans = Plan.where('level < 2').limit(5)

    @almost_plans = Plan.all.limit(5)

  end

  def create
    @user = current_user
    page = Page.new(page_params)
    #page.save
    @wish = Wish.new( name: page.name,
                      start_date: page.start_date,
                      end_date: page.end_date,
                      user_id: current_user.id )

    if @wish.save
      flash[:notice] = '願望已成功建立'
    else
      flash[:alert] = @wish.errors.full_messages.to_sentence
    end
    redirect_to edit_wish_path(@wish)
  end

  def about
  end

  def privacy

  end

end
