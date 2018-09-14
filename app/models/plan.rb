class Plan < ApplicationRecord
  #mount_uploader :image, ImageUploader
  belongs_to :user , :class_name => "User", :foreign_key => "owner_id"
  validates :name, :presence => true
end
