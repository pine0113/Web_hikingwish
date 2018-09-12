class WishesController < ApplicationController
  before_action :set_wish, :only => [:edit, :update]

  def index
    @wishes = current_user.wishes.order(created_at: :desc)
    @user = current_user
    #@recent_questions = Question.order(created_at: :asc).limit(10)
    #@pop_questions = Question.order(likes_count: :desc).limit(10)
    
    # @users # 基於測試規格，必須講定變數名稱，請用此變數中存放關注人數 Top 10 的使用者資料
    #@question = Question.new # 新 question_form 使用
  end

  def new
    @wish = Wish.new
  end

  def create
    #params.require(:tweet).permit(:description, :user_id)
    @user = current_user
    #@tweet = Tweet.new(tweet_params)
    @wish = current_user.wishes.build(wish_params)

    if @wish.save
      flash[:notice] = "wish was successfully created"
    else
      flash[:alert] = "wish was failed to create"
    end
    redirect_back(fallback_location: wishes_path)
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

    def wish_params
      params.require(:wish).permit(:name, :level, :start_day, :end_day, :user_id)
    end  

end
