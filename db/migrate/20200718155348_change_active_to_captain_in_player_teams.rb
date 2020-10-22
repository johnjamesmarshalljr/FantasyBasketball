class ChangeActiveToCaptainInPlayerTeams < ActiveRecord::Migration[6.0]
  def change
    rename_column :player_teams, :active, :captain
  end
end
