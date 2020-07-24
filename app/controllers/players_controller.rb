class PlayersController < ApplicationController

  def index
    @players = Player.all
    @guards = Player.get_guards
    @forwards = Player.get_forwards
    @centers = Player.get_centers
  end

end
