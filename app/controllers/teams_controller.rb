class TeamsController < ApplicationController
# before_action :authenticate_user, except: [:index, :show]


def index
   if params[:user_id]
    @teams = current_user.teams
  else
    @teams = Team.all
  end
end

def create
  #REFACTOR, work with nested params, add more players to team
@new_team = current_user.teams.build(team_params)
if @new_team.save
  redirect_to new_team_player_team_path(@new_team)
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
    params.require(:team).permit(:team_name)
end

end
