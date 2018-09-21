class CreateMessenges < ActiveRecord::Migration[5.1]
  def change
    create_table :messenges do |t|
      t.integer :user_id
      t.text :content
      t.integer :chatable_id
      t.string :chatable_type
      t.timestamps
    end
  end
end
