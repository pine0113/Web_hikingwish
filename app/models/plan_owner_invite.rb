class PlanOwnerInvite < ApplicationRecord
  validates :user_id, uniqueness: { scope: :plan_id }
  belongs_to :plan
  belongs_to :user
end
