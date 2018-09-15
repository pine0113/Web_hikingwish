class Plan < ApplicationRecord
  #mount_uploader :image, ImageUploader
  belongs_to :user , :class_name => "User", :foreign_key => "owner_id"
  has_many :notification, :as => :notifiable

  validates :name, :presence => true
  validates :owner_id, :presence => true # 一定要有user id
end
