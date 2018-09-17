class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy, :prepare, :prepare_team, :invite_member]

  def index
    if user_signed_in?
      case params[:type]
      when 'applied'
        @plans = current_user.applied_plans
      when 'invited'
        @plans = current_user.invited_plans
      else
        @plans = (current_user.plans + current_user.joined_plans).uniq
      end

    else
      @plans = Plan.all.limit(10)
    end
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

  def all
     if user_signed_in? 
      @plans = Plan.where('owner_id != :user_id', {user_id: current_user.id})
     else
      @plans = Plan.all
     end
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
    @sent_applies = @plan.sent_applies.where()
  end

  def search
  end

  def invite_member
    @users = User.all
  end

  def send_invite
    set_plan
    @user = User.find(params[:user_id])
    @invite = @plan.receive_invites.build
    @invite.user = @user
    if @invite.save
      flash[:notice] = "invite was successfully created"
    else
      flash[:alert] = "invite was failed to create"
    end
    session[:return_to] ||= request.referer
    redirect_to session[:return_to]
  end

  def apply
    set_plan
    @apply = current_user.sent_applies.build
    @apply.plan = @plan
    if @apply.save
      flash[:notice] = "apply was successfully created"
    else
      flash[:alert] = "apply was failed to create"
    end
    session[:return_to] ||= request.referer
    redirect_to session[:return_to]
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

end
