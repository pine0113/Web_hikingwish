class CreateHikings < ActiveRecord::Migration[5.1]
  def change
    create_table :hikings do |t|
      t.string :name
      t.string :title
      t.string :image
      t.integer :level
      t.integer :day
      t.integer :miles
      t.text    :intro

      t.timestamps
    end
  end
end
