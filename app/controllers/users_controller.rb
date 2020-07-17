class UsersController < ApplicationController

def home

end

def show
  @user = current_user
  @player_teams = current_user.player_teams
end

end
