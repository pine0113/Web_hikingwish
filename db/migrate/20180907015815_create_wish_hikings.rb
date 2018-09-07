class CreateWishHikings < ActiveRecord::Migration[5.1]
  def change
    create_table :wish_hikings do |t|
      t.integer :wish_id
      t.integer :hiking_id
      t.timestamps
    end
  end
end
