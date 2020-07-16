class AddForeignKeyColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :user_id, :integer
    add_column :teams, :team_name, :string
  end
end
