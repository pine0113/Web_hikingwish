class AddNotificationReaded < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :is_readed, :boolean, :default => false
  end
end
