class RemoveBudgeFinalDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :plans, :budget_final, :integer, :default => nil
  end
end
