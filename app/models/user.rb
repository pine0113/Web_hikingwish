class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  mount_uploader :avatar, AvatarUploader

  # email 跟 password欄位 deivse 已強制要求
  validates_presence_of :name

  has_many :plans
  has_many :wishes
  has_many :notifications

  # user applay plan
  has_many :plan_member_applies
  has_many :plan_members
  # got owner_plan for user
  has_many :plan_owner_invite, -> { where accept: false }
  has_many :owner_invite_plan, through: :plan_owner_invite, source: :plan

  def admin?
    self.role == "admin"
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.name = auth.info.name
    user.password = Devise.friendly_token[0,20]
    user.save!
    return user
  end
  
end
