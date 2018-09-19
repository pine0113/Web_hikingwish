class CatesController < ApplicationController
  before_action :set_cate, :only => [:list]

  def list
    @hikings = @cate.hikings
  end

  private
  
    def set_cate
      @cate = Cate.find(params[:id])
    end
end
