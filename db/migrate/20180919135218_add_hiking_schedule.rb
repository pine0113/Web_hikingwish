class AddHikingSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :hikings, :schedule, :text
  end
end
