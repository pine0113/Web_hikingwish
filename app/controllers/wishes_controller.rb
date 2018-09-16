class WishesController < ApplicationController
  before_action :set_wish, :only => [:edit, :update, :destroy]

  def index
    @wishes = current_user.wishes.order(created_at: :desc)
    @user = current_user
  end

  def new
    @wish = Wish.new
  end

  def create
    @user = current_user
    @wish = current_user.wishes.build(wish_params)

    if @wish.save
      flash[:notice] = "wish was successfully created"
    else
      flash[:alert] = "wish was failed to create"
    end
    redirect_to wishes_path
  end

  def destroy
    @wish.destroy
    redirect_to wishes_path
  end

  def show
    @wish = wish.find(params[:id])
  end

  def edit

  end

  def update
    if @wish.update(wish_params)
      flash[:notice] = "資料已更新！"
      redirect_to wishes_path      
    else
      render :edit
      flash[:alert] = "資料更新失敗！"
    end
  end

  def make_plan
  end

  def plan
  end

  private
  
    def set_wish
      @wish = Wish.find(params[:id])
    end
<<<<<<< HEAD
=======

    def wish_params
      params.require(:wish).permit(:name, :level, :start_date, :end_date, :user_id, :budget_bottom, :budget_top, :description, :car_list, :food_list, )
    end  
>>>>>>> 519d576de6fb97b9bad3c6aec91d095a05983c4e
end
