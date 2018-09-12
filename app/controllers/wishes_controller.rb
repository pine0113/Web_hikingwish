class WishesController < ApplicationController

  def index
    @wishes = current_user.wishes.order(created_at: :desc)
    @user = current_user
    gon.wishes = @wishes
    gon.wishf = gon.wishes.first
    gon.wishl = @wishes.last
    gon.test = "test"
    #@recent_questions = Question.order(created_at: :asc).limit(10)
    #@pop_questions = Question.order(likes_count: :desc).limit(10)
    
    # @users # 基於測試規格，必須講定變數名稱，請用此變數中存放關注人數 Top 10 的使用者資料
    #@question = Question.new # 新 question_form 使用
  end

  def show
  end

  def edit
  end

  def update
  end

  def make_plan
  end

  def plan
  end

end
