class AddInviteAndApplyDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :plan_owner_invites, :accept, :boolean, :default => false
    change_column :plan_member_applies, :accept, :boolean, :default => false
  end
end
