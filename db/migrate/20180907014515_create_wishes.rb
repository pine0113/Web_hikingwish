class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :budget_bottom
      t.integer :budget_top
      t.integer :user_id
      t.timestamps
    end
  end
end
