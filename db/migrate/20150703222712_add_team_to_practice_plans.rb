class AddTeamToPracticePlans < ActiveRecord::Migration
  def change
  	add_column :practice_plans, :team_id, :integer
  end
end
