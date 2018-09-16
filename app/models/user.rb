class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  # email 跟 password欄位 deivse 已強制要求
  validates_presence_of :name

  has_many :plans
  has_many :wishes
  has_many :notifications

  # been plan member
  has_many :plan_members
  # check user already in plan
  has_many :been_plan_members, through: :plan_members, source: :user
  # for user been invite
  has_many :plan_owner_invites, -> {where status: false}
  # get plan for user show
  has_many :respond_invite, through: :plan_owner_invites, source: :plan 

  def admin?
    self.role == "admin"
  end

end
