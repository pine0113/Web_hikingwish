class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end

  def show
    notify = Notification.find(params[:id])
    notify.is_readed = true
    notify.save
    case notify.notifiable_type
      when "PlanOwnerInvite" 
        redirect_to plan_owner_invite_path(notify.notifiable_id)
      when "PlanMemberApply" 
        redirect_to plan_member_apply_path(notify.notifiable_id)
      when "PlanMember" 
        redirect_to plan_path(PlanMember.find(notify.notifiable_id).plan)
    end
  end

end
