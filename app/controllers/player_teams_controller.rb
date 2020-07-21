
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
   if current_user
    @teams = current_user.teams
     # binding.pry
     # @team = Team.find_by(id:params[:team_id])
     # @team.player_ids = pt_params.values
     @player_teams = PlayerTeam.where(:team_id => params[:team_id])
      @player_team_captain = PlayerTeam.find_by(id: params[:team_id])
      # @teams.each do |t
      #   t.plafgfyer_teams
      # last.player_teams.last.captain?
      # pt belongs to player
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
  # trans over to teams controller
  team = Team.find_by(id:params[:team_id])
   # \binding.pry
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
