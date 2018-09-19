class CreateCates < ActiveRecord::Migration[5.1]
  def change
    create_table :cates do |t|
      t.string :name
      t.timestamps
    end
  end
end
