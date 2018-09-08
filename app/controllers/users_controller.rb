class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
  end

  def show
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :intro, :avatar))
      flash[:notice] = "個人資料更新成功"
      redirect_to users_path
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

end
