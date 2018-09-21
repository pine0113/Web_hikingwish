class PlanMemberApply < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  has_many :notification, :as => :notifiable
  has_many :messenges, :as => :chatable
end
