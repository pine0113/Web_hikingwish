class AddPlanLockDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :plans, :lock_status, :string, default: "開放報名"
  end
end
