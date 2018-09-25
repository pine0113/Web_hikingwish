class AddPlanMemberNum < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :member_max, :integer, :default => 4
  end
end
