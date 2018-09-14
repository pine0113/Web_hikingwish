class HikingsController < ApplicationController

  def index
    @hikings = Hiking.all
  end

  def show
    set_hiking
  end

  def plans
  end

  def wishes
  end

  def add_to_wish
    set_hiking
    
    @wish = current_user.wishes.build
    @wish.name = @hiking.name
    if @wish.save
      flash[:notice] = "wish was successfully created"
    else
      flash[:alert] = "wish was failed to create"
    end
    session[:return_to] ||= request.referer
    redirect_to session[:return_to]
  end

  private
  
  def set_hiking
    @hiking = Hiking.find(params[:id])
  end

end
