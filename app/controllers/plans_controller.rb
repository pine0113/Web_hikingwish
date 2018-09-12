class PlansController < ApplicationController
  before_action :find_plan, only: [:show, :edit, :update, :destroy]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user = current_user
    if @plan.save
      flash[:notice] = "計畫建立完成"
      redirect_to plans_path
    else
      flash[:alert] = @plan.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      flash[:notice] = "計畫已更新"
      redirect_to @plan
    else
      flash[:alert] = @plan.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @plan.destroy
    flash[:alert] = "路線已刪除"
    redirect_to plans_path
  end

  def search
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :image, :start_date, :end_date, :budget_top, :budget_bottom, :budget_final, :level, :day, :miles, :intro)
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end

end
