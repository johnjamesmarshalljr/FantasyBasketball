class Team < ApplicationRecord
  belongs_to :user
  has_many :player_teams
  has_many :players, through: :player_teams

   validates :team_name, uniqueness: true

    accepts_nested_attributes_for :player_teams
  # accepts_nested_attributes_for :players
    # validate :minimum_three_players
    # validate :unique_players
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
# def minimum_three_players
#   if self.player_teams != 3
#     errors.add(:players, "must have three players on a team")
#   end
# end

end
