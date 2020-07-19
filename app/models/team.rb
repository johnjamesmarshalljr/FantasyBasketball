class Team < ApplicationRecord
  belongs_to :user
  has_many :player_teams
  has_many :players, through: :player_teams

  accepts_nested_attributes_for :player_teams

# def player_teams_attributes=(pt_params)
#   pt_params.values.each do |pr_attrs|
#     unless pr_attrs.values.any?(&:empty?)
#     self.player_teams << PlayerTeam.new(pr_attrs)
# end
#
# end

end
