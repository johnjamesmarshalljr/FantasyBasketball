class Team < ApplicationRecord
  belongs_to :user
  has_many :player_teams
  has_many :players, through: :player_teams

def player_teams_attributes=(pt_params)
  binding.pry
end



end
