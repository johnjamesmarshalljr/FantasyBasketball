class TeamsController < ApplicationController
before_action :authenticate_user, except: [:index, :show]


def index


   if params[:user_id]
    @teams = current_user.teams
  else 
    @teams = Team.all
  end
end


def show

end

def new

end


def create


end

def edit

end

def update

end



end
