class PlayerTeamsController < ApplicationController

def index
  # binding.pry
   if current_user
    @teams = current_user.teams
    @player_teams = PlayerTeam.where(:team_id => params[:team_id])
  else
    @teams = Team.all
  end
end

  def show
  if params[:user_id]
   @teams = current_user.teams.find_by(id:params[:team_id])
  else
   @teams = Team.all
  end
  end

  def create
    team = Team.find_by(id:params[:team_id])
      team.players << team.player_teams
    if team.players.empty?
      team.player_ids = pt_params.values
    else
      pt_params.values.each {|n| team.player_ids << n}
    end
      redirect_to user_team_path(current_user, team)
    end

private
def pt_params
  params.permit(:guard_id, :forward_id, :center_id, :player_teams_attributes)
end
#returns hash with all
end
