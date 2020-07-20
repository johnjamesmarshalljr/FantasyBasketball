class PlayerTeam < ApplicationRecord
  belongs_to :team
  belongs_to :player



alias_attribute :guard_id, :player_id
alias_attribute :forward_id, :player_id
alias_attribute :center_id, :player_id

end
