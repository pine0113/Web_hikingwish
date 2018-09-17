class WishesController < ApplicationController
  before_action :set_wish, :only => [:edit, :update, :destroy, :search, :make_plan]

  def index
    @wishes = current_user.wishes.order(created_at: :desc)
    @user = current_user
    @plans = Plan.first(3)
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

  def search
    hiking = @wish.hiking
    @plans = hiking.plans
    
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
    @plan = Plan.new(name: @wish.name, hiking: @wish.hiking, day: @wish.day, intro: @wish.description, owner_id: current_user.id)
    if @plan.save
      flash[:notice] = "計畫已成功建立"
    else
      flash.now[:alert] = "計畫建立失敗"
    end
    redirect_to edit_plan_path(@plan)
  end

  def plan
  end

  private
  
    def set_wish
      @wish = Wish.find(params[:id])
    end
   
end
