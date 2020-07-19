
class PlayerTeamsController < ApplicationController

# def new
#   # binding.pry
#   @team = Team.find_by(id:params(id:[team_id])
#   @guard = Player.get_guards
#   @forward = Player.get_forwards
#   @center = Player.get_centers
#   # binding.pry
# end

def index
  # binding.pry
   if params[:user_id]
    @team = current_user.teams
     @player_teams = @team.player_teams
  else
    @teams = Team.all
  end
end


def show
  if params[:user_id]
   @teams = current_user.teams.find_by(id:params[:id])
   @player_team = @teams.players
 else
   @teams = Team.all
 end
end

def create
  # trans over to teams controller
  team = Team.find_by(id:params[:team_id])
   # binding.pry
   team.players << team.player_teams
  if team.players.empty?
    team.player_ids = pt_params.values
  else
    pt_params.values.each {|n| team.player_ids << n}
  end

  redirect_to user_team_path(current_user, team)
end
#code in validations with java script front end?

private
def pt_params
  params.permit(:guard_id, :forward_id, :center_id, :player_teams_attributes)
end
#returns hash with all
end
