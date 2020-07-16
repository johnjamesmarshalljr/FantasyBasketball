class CreatePlayerTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :player_teams do |t|
      t.belongs_to :team
      t.belongs_to :player
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
