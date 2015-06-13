class AddPeriodsIndex < ActiveRecord::Migration
  def change
  	add_index :periods, [:practice_plan_id, :row_order]
  end
end
