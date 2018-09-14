class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :content
      t.integer :notifiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end
end
