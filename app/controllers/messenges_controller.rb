class MessengesController < ApplicationController
  
  def create
    @messenge = Messenge.new(messenge_params)
      @messenge.user = current_user
    if @messenge.save
      flash[:notice] = 'messenge was successfully update'
    else
      flash.now[:alert] = 'messenge was failed to update'
    end

    session[:return_to] ||= request.referer
    redirect_to session[:return_to]

  end

  private
  def messenge_params
    params.require(:messenge).permit(:content,:chatable_id,:chatable_type)
  end

end
