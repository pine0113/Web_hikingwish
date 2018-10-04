class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :hiking_id
      t.timestamps
    end
  end
end
