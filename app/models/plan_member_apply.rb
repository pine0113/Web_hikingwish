class PlanMemberApply < ApplicationRecord
  validates :user_id, uniqueness: { scope: :plan_id }
  belongs_to :user
  belongs_to :plan
end
