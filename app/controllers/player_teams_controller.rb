class PlayerTeamsController < ApplicationController

  def index
    if current_user
      @teams = current_user.teams
      @player_teams = PlayerTeam.where(:team_id => params[:team_id])
    end
  end

end
