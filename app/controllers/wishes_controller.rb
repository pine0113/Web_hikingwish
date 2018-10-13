class WishesController < ApplicationController
  before_action :set_wish, :only => [:edit, :update, :destroy, :search, :make_plan]
  before_action :authenticate_user!, :only => [:index, :create, :edit, :update, :destroy, :search, :make_plan, :statistics]


  def index
    @wishes = current_user.wishes.order(created_at: :desc)
    @user = current_user
    @plans = Plan.first(3)
  end

  def new
    @wish = Wish.new
    @hiking = Hiking.all
  end

  def create
    @user = current_user
    @wish = current_user.wishes.build(wish_params)

    if @wish.save
      flash[:notice] = '願望已成功建立'
    else
      flash[:alert] = @wish.errors.full_messages.to_sentence
    end
    redirect_to wishes_path
  end

  def destroy
    @wish.destroy
    redirect_to wishes_path
  end

  def search
    hiking = @wish.hiking

    if @wish.start_date.nil?
      plans3 = Plan.all
    else
      plans3 = Plan.all.where(:start_date => @wish.start_date..@wish.end_date)
    end

    if @wish.budget_bottom.nil?
      plans4 = Plan.all
    else
      plans4 = Plan.all.where(:budget_bottom => @wish.budget_bottom..@wish.budget_top)
    end

    plans = Plan.all

      case params[:type]
      when 'owned'
        plans = current_user.plans.where("hiking_id = #{hiking.id}")
      when 'applied'
        plans = current_user.applied_plans.where("hiking_id = #{hiking.id}")
      when 'invited'
        plans = current_user.invited_plans.where("hiking_id = #{hiking.id}")
      else
        plans = Plan.all.where("hiking_id = #{hiking.id}") - current_user.applied_plans - current_user.invited_plans - current_user.plans
      end

      @plans = plans3 & plans4 & plans

  end

  def update
    if @wish.update(wish_params)
      flash[:notice] = '資料已更新！'
      redirect_to wishes_path
    else
      render :edit
      flash[:alert] = @wish.errors.full_messages.to_sentence
    end
  end

  def make_plan
    @plan = Plan.new(name: @wish.name,
                     hiking: @wish.hiking,
                     numberofday_id: @wish.numberofday_id,
                     intro: @wish.description,
                     level: @wish.level,
                     owner_id: current_user.id)
    if @plan.save
      flash[:notice] = '計畫已成功建立'
    else
      flash.now[:alert] = @plan.errors.full_messages.to_sentence
    end
    redirect_to edit_plan_path(@plan)
  end
  private

  def set_wish
    @wish = Wish.find(params[:id])
  end
end
