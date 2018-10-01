class AddPlanCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :apply_preparation, :string, :default => "未完成"
    add_column :plans, :apply_note, :text
    add_column :plans, :traffic_preparation, :string, :default => "未完成"
    add_column :plans, :traffic_note, :text
    add_column :plans, :weather_preparation, :string, :default => "未完成"
    add_column :plans, :weather_note, :text
    add_column :plans, :gear_preparation, :string, :default => "未完成"
    add_column :plans, :gear_note, :text
  end
end
