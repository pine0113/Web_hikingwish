class TagsController < ApplicationController

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @items = (Hiking.tagged_with(@tag.name))
  end
  
end
