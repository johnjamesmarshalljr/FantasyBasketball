class TeamsController < ApplicationController
# before_action :authenticate_user, except: [:index, :show]


def index
  # binding.pry
   if params[:user_id]
    @teams = current_user.teams
    @players = current_user.players


  else
    @teams = Team.all
  end
end

def create
  #REFACTOR, work with nested params, add more players

@new_team = current_user.teams.build(team_params)
    # @new_team.players << current_user.players
     # binding.pry
     # p =  Player.find_by(params[:team][:player_teams_attributes])

  # @new_team.players << p
if @new_team.save
  redirect_to user_team_path(current_user, @new_team)
    # redirect_to teams_path
else
    render :new
end
end

def new
  # binding.pry
  @guard = Player.get_guards
  @forward = Player.get_forwards
  @center = Player.get_centers
    @team = Team.new
    @team.player_teams.build
    @team.player_teams.build
    @team.player_teams.build
end

def show
   # binding.pry
  @team = Team.find_by(id:params[:id])


end


def edit

end

def update

end

private

def team_params
    params.require(:team).permit(:team_name, :player_teams_attributes => [:player_id, :captain])
end

end
