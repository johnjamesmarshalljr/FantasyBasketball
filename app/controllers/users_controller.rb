class UsersController < ApplicationController
  # before_action :authenticate_user!, except: :home
def home

end

def show
  # binding.pry
  @user = current_user
   @player_teams = current_user.player_teams

end

end
