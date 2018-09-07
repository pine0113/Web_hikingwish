class CreatePlanOwnerInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_owner_invites do |t|
      t.integer :plan_id
      t.integer :user_id
      t.boolean :accept
      t.boolean :notified
      t.timestamps
    end
  end
end
