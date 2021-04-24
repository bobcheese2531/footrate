class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :game_id
      t.string :position
      t.string :player_name
      t.string :player_text
      t.integer :player_rate

      t.timestamps
    end
  end
end
