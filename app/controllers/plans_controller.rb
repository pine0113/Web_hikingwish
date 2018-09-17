class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy, :prepare, :prepare_team]

  def index
    @plans = Plan.where('owner_id = :user_id', {user_id: current_user.id})
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
    @users = User.all
  end

  def edit
  end

  def all
      @plans = Plan.where('owner_id != :user_id', {user_id: current_user.id})
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

  def prepare
  end

  def prepare_team
  end

  def search
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

end
