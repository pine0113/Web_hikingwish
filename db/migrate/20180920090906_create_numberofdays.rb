class CreateNumberofdays < ActiveRecord::Migration[5.1]
  def change
    create_table :numberofdays do |t|
      t.string :name
      t.timestamps
    end
  end
end
