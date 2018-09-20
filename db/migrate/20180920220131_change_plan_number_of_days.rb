class ChangePlanNumberOfDays < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :numberofday_id, :integer
  end
end
