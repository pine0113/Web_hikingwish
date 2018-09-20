class AddPlanDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :plans, :level, :integer, :default => 1
    change_column :plans, :budget_bottom, :integer, :default => 0
    change_column :plans, :budget_top, :integer, :default => 0
    change_column :plans, :budget_final, :integer, :default => 0
    change_column :plans, :level, :integer, :default => 1
    change_column :plans, :miles, :integer, :default => 0
    change_column :plans, :level, :integer, :default => 0
    change_column :plans, :food_type, :string, :default => "未定"
    change_column :plans, :car_type, :string, :default => "未定"
    change_column :plans, :money_type, :string, :default => "未定"
    change_column :plans, :group_type, :string, :default => "未定"
    change_column :plans, :publish_status, :string, :default => "公開"
    change_column :plans, :numberofday_id, :integer, :default => 1
  end
end