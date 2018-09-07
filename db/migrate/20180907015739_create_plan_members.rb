class CreatePlanMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_members do |t|
      t.integer :plan_id
      t.integer :user_id
      t.timestamps
    end
  end
end
