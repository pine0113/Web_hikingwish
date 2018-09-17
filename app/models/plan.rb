class Plan < ApplicationRecord
  #mount_uploader :image, ImageUploader
  belongs_to :user , :class_name => "User", :foreign_key => "owner_id"
  has_many :notification, :as => :notifiable
  validates :name, :presence => true
  # belongs_to 已有強制規定要 owner_id
  # validates :owner_id, :presence => true # 一定要有user id

  # has many plan member
  has_many :plan_members
  # check user already in plan
  has_many :been_plan_members, through: :plan_members, source: :user
  # has many memebr apply
  has_many :plan_member_applies, -> { where status: false}
  # get member for plan
  has_many :respond_apply, through: :plan_member_applies, source: :user

end
