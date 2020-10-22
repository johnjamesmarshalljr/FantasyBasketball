class Team < ApplicationRecord
  belongs_to :user
  has_many :player_teams
  has_many :players, through: :player_teams

   validates :team_name, uniqueness: true, presence: true
   validate :minimum_three_players

     accepts_nested_attributes_for :player_teams, :reject_if => proc {|attributes| attributes.any?{|k, v| v.blank? if k == "player_id"}}

    def get_captain
      self.player_teams.find_by(captain: true).player
    end

    def minimum_three_players
      if self.player_teams.length != 3
        errors.add(:players, "must have three players on a team")
      end
    end

  end
