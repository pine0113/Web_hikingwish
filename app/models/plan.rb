class Plan < ApplicationRecord
  #mount_uploader :image, ImageUploader
  belongs_to :user , :class_name => "User", :foreign_key => "owner_id"
  has_many :notification, :as => :notifiable

  validates :name, :presence => true
  validates :owner_id, :presence => true # 一定要有user id

  has_many :plan_member_applies, -> {where accept: false}
  has_many :respond_join, through: :plan_member_applies, source: :user
end
