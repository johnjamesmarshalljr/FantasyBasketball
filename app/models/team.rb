class Team < ApplicationRecord
  belongs_to :user
  has_many :player_teams
  has_many :players, through: :player_teams

   validates :team_name, uniqueness: true


    accepts_nested_attributes_for :player_teams
  # accepts_nested_attributes_for :players

# def player_teams_attributes=(pt_params)
#   # binding.pry
#   pt_params.values.each do |pr_attrs|
#     # unless pr_attrs.values.any?(&:empty?)
#      # binding.pry
#
#     self.player_teams << PlayerTeam.find_or_create_by(pr_attrs)
# # build // findorcreateby
#
#  end
# end
end
