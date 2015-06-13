class RemovePeriodsIndex < ActiveRecord::Migration
  def change
  	remove_index :periods, [:practice_plan_id, :created_at]
  end
end
