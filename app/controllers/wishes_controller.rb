class WishesController < ApplicationController
  before_action :set_wish, :only => [:create, :edit, :update, :destroy, :search, :make_plan]
  before_action :authenticate_user!, :only => [:index, :create, :edit, :update, :destroy, :search, :make_plan]


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
    @wish.food_mode == 1 ? plans1 = Plan.all : plans1 = Plan.all.where("food_mode = #{@wish.food_mode}") + Plan.all.where("food_mode = 1")
    @wish.transport_mode == 1 ? plans2 = Plan.all : plans2 = Plan.all.where("transport_mode = #{@wish.transport_mode}") + Plan.all.where("transport_mode = 1")
    @wish.fee_mode == 1 ? plans3 = Plan.all : plans3 = Plan.all.where("fee_mode = #{@wish.fee_mode}") + Plan.all.where("fee_mode = 1")
    #plan4 = Plan.where("budget_final <= #{@wish.budget_top} and budget_final >= #{@wish.budget_top} ")

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

    @plans = plans1 & plans2 & plans3 & plans

  end

  def show
    @wish = wish.find(params[:id])
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
