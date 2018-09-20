class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :image
      t.date :start_date
      t.date :end_date
      t.integer :budget_bottom
      t.integer :budget_top
      t.integer :budget_final
      t.integer :level
      t.integer :numberofday_id, default: 10
      t.integer :miles
      t.text    :intro
      t.integer :join_count
      t.integer :owner_id
      t.timestamps
    end
  end
end
