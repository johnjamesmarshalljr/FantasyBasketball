class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :firstName
      t.string :lastName
      t.string :yearsPro
      t.string :country
      t.string :position
      t.timestamps
    end
  end
end
