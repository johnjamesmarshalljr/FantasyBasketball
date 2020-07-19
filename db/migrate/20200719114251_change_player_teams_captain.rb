class ChangePlayerTeamsCaptain < ActiveRecord::Migration[6.0]
  def change
    change_column_default :player_teams, :captain, false
  end
end
