class PlayerTeamsController < ApplicationController

def index
  if current_user
    @teams = current_user.teams
    @player_teams = PlayerTeam.where(:team_id => params[:team_id])
  else
    @teams = Team.all
  end
end

private

def pt_params
  params.permit(:guard_id, :forward_id, :center_id, :player_teams_attributes)
end

end
