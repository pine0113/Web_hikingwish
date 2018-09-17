class Plan < ApplicationRecord
  #mount_uploader :image, ImageUploader
  belongs_to :user , :class_name => "User", :foreign_key => "owner_id"
  has_many :notification, :as => :notifiable

  validates :name, :presence => true
  validates :owner_id, :presence => true # 一定要有user id

  has_many :plan_member_applies, -> {where accept: false}
  has_many :respond_join, through: :plan_member_applies, source: :user

  # 以合格的plan user
  has_many :plan_members
  # got confirm user for plan page
  has_many :confirm_users, through: :plan_members, source: :user
  # for owner invite user
  has_many :plan_owner_invite
end
