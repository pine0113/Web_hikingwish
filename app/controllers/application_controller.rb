class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end


  private

  def wish_params
    params.require(:wish).permit(:name, :level, :start_day, :end_day, :user_id)
  end  

  def plan_params
    params.require(:plan).permit(:name, :image, :start_date, :end_date, :budget_top, :budget_bottom, :budget_final, :level, :day, :miles, :intro)
  end

  
end
