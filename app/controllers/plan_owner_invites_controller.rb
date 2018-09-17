class PlanOwnerInvitesController < ApplicationController

  def show
    set_invite
  end

  def approval
    set_invite
    @invite.accept = true
    if @invite.save
      flash[:notice] = "invite was success"

      plan = Plan.find(@invite.plan.id)
      join = plan.joins.build
      join.user = @invite.user

      if join.save
        notify_plan_member_success_apply(@invite.user,plan)
      end

    else
      flash[:alert] = "invite was failed"
    end
    
    redirect_to plan_path(@invite.plan)
  end

  private
  
  def set_invite
    @invite = PlanOwnerInvite.find(params[:id])
  end

end
