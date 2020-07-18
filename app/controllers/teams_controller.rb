class TeamsController < ApplicationController
# before_action :authenticate_user, except: [:index, :show]


def index


   if params[:user_id]
    @teams = current_user.teams
  else
    @teams = Team.all
  end
end


def show
  # binding.pry
  @team = Team.find_by(params[:team_id])
end

def new
  # binding.pry
  @user = current_user
    @team = Team.new(params[:team_id])
end


def create


end

def edit

end

def update

end



end
