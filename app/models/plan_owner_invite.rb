class PlanOwnerInvite < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  has_many :notification, :as => :notifiable
  
end
