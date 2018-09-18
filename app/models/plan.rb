class Plan < ApplicationRecord
  #mount_uploader :image, ImageUploader
  belongs_to :hiking
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :notification, :as => :notifiable

  validates :name, :presence => true
  #validates :owner_id, :presence => true # 一定要有user id

  has_many :joins, class_name: 'PlanMember', foreign_key: 'plan_id'
  has_many :members, through: :joins, source: :user

  has_many :receive_invites, -> { where(:accept => false )}, class_name: 'PlanOwnerInvite' ,foreign_key: 'plan_id'
  has_many :invited_members, through: :receive_invites, source: :user

  has_many :sent_applies, -> { where(:accept => false )}, class_name: 'PlanMemberApply', foreign_key: 'plan_id'
  has_many :applied_members, through: :sent_applies, source: :user

  def is_member?(user)
    members.include?(user) or (owner == user)
  end

  def is_invited?(user)
    invited_members.include?(user)
  end

  def is_applied?(user)
    applied_members.include?(user)
  end

  def get_invite(user)
    (receive_invites.select { |invite| invite.user_id ==  user.id}).first
  end


  def user_status(user)
    if owner == user
      return "owner"
    end

    if is_member?(user)
      return "member"
    end

    if is_invited?(user)
      return "invited"
    end

    if is_applied?(user)
      return "applied"
    end
     
  end

end
