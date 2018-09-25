class MessengesController < ApplicationController
  
  def create
    @messenge = Messenge.new(messenge_params)
      @messenge.user = current_user
    if @messenge.save
      flash[:notice] = 'messenge was successfully update'
    else
      flash.now[:alert] = 'messenge was failed to update'
    end

    case @messenge.chatable_type
    when "PlanMemberApply"
      redirect_to plan_member_apply_path(@messenge.chatable_id)
    when "PlanOwnerInvite"
      redirect_to plan_owner_invite_path(@messenge.chatable_id)
    end
   
    session[:return_to]

  end

  private
  def messenge_params
    params.require(:messenge).permit(:content,:chatable_id,:chatable_type)
  end

end
