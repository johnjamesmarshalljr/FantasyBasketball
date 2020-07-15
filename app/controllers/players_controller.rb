class PlayersController < ApplicationController

def show
  @players = Player.all
end

# def new
#   @player = Player.new
# # create this helper
#   # @player.build_player
#   # @player = current_user.teams
# end
#
# def create
#   @new_player = Player.new(player_params)
#   @new_player.team.user = current_user unless @new_player.house.user
#   @new_player.save
#   redirect_to team_path(@new_player.team)
# end
#
# def destroy
# end



end
