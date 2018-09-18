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
    params.require(:wish).permit(:name, :hiking_id, :level, :start_date, :end_date, :user_id, :budget_bottom, :budget_top, :description, :car_list, :food_list)
  end  

  def plan_params
    params.require(:plan).permit(:name, :image, :start_date, :end_date, :budget_top, :budget_bottom, :budget_final, :level, :day, :miles, :intro, :group_type, :money_type, :food_type, :food_info, :car_type, :car_info, :publish_status, :lock_status, :schedule)
  end


end
