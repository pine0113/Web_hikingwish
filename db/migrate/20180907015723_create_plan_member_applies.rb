class CreatePlanMemberApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_member_applies do |t|
      t.integer :plan_id
      t.integer :user_id
      t.bool :accept
      t.bool :notified
      t.timestamps
    end
  end
end
