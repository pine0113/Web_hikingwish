class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy, :prepare, :prepare_team]

  def index
    if user_signed_in? 
      @plans = (Plan.where('owner_id = :user_id', {user_id: current_user.id}))
     else
      @plans = Plan.all
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
    @respond_join = @plan.respond_join
    @confirm_users = @plan.confirm_users
    # for owner invite user
    @users = User.all
  end

  def search
  end

  def join_plan
    # @plan = Plan.find(params[:id])
    set_plan
    @join = current_user.plan_member_applies.build(plan_id: params[:id], accept: false)

    if @join.save
      flash[:notice] = "申請加入#{@plan.name}"
      redirect_back(fallback_location: plans_path)
    else
      flash[:alert] = @join.errors.full_messages.to_sentence
      redirect_back(fallback_location: plans_path)
    end
  end

  def accept_join
    @plan = Plan.find(params[:plan_id])
    @user = User.find(params[:user_id])
    accept_join = PlanMemberApply.where(plan_id: @plan, user_id: @user)

    if accept_join.update(accept: true)
      PlanMember.create(plan_id: @plan, user_id: @user)
      flash[:notice] = "允許參加"
      redirect_back(fallback_location: plans_path)
    else
      flash[:alert] = accept_join.errors.full_messages.to_sentence
      redirect_back(fallback_location: plans_path)
    end
  end

  def invite_user
    @user = User.find(params[:user_id])
    @plan = Plan.find(params[:plan_id])
    invite_user = @user.plan_owner_invite.build(plan_id: params[:plan_id], accept: false)

    if invite_user.save
      flash[:notice] = "邀請#{@user.name}加入"
      redirect_back(fallback_location: plans_path)
    else
      flash[:alert] = invite_user.errors.full_messages.to_sentence
      redirect_back(fallback_location: plans_path)
    end
  end

  def respond_invite
    set_plan
    @respond_invite = PlanOwnerInvite.where(plan_id: params[:id], user_id: current_user.id)

    if @respond_invite.update(accept: true)
      # PlanMember.create(plan_id: @plan, user_id: @user)
      flash[:notice] = "參加#{@plan.name}"
      redirect_back(fallback_location: plans_path)
    else
      flash[:alert] = respond_invite.errors.full_messages.to_sentence
      redirect_back(fallback_location: plans_path)
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

end
