class PlanMemberAppliesController < ApplicationController

  def show
    set_apply
  end

  def approval
    set_apply
    @apply.accept = true
    if @apply.save
      flash[:notice] = "apply was success"

      plan = Plan.find(@apply.plan.id)
      join = plan.joins.build
      join.user = @apply.user
      if join.save
        notify_plan_member_success_apply(@apply.user,plan)
      end
    else
      flash[:alert] = "apply was failed"
    end
    session[:return_to] ||= request.referer
    redirect_to session[:return_to]
  end


  private 
  def set_apply
    @apply = PlanMemberApply.find(params[:id])
  end
end
