class PlayerTeamsController < ApplicationController

  def new
    @team = Team.find_by_id(params[:team_id])
    @guard = Player.get_guards
    @forward = Player.get_forwards
    @center = Player.get_centers
  end

  def create
    team = Team.find_by_id(params[:team_id])
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
    params.permit(:guard_id, :forward_id, :center_id)
  end
  #returns hash with all
end
