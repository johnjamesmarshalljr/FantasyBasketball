class TeamsController < ApplicationController
# before_action :get_team, except: [:index, :create, :new]

  def index
    if params[:user_id]
      @teams = current_user.teams
      @players = current_user.players
    end
  end

  def create
    @new_team = current_user.teams.build(team_params)
    if @new_team.save
      redirect_to user_team_path(current_user, @new_team)
    else
      @new_team.player_teams.build
      render :new
    end
  end

  def new
    @team = Team.new
    @team.player_teams.build
    @team.player_teams.build
    @team.player_teams.build
  end

  def show
    get_team
    @player_teams = @team.player_teams
  end

  def edit
    get_team
    if current_user.teams.include?(@team)
      render :edit
    else
    redirect_to user_teams_path(current_user)
    end
  end

  def update
    get_team
    if @team.update(team_params)
      redirect_to user_team_path(current_user, @team)
    else
    render :edit
    end
  end

  def destroy
    get_team
    @team.destroy if current_user.teams.include?(@team)
    redirect_to user_teams_path(current_user)
  end

  private

  def get_team
    @team = Team.find_by(id:params[:id])
  end

  def team_params
    params.require(:team).permit(:team_name, :player_teams_attributes => [:player_id, :captain, :id])
  end

end
