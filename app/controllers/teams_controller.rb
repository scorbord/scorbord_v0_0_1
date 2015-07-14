class TeamsController < ApplicationController

	def set
		if current_team == nil
			set_team(Team.find(params[:team_id]))
			redirect_to root_path
		else
			set_team(Team.find(params[:team_id]))
			redirect_to :back
		end
	end
end
