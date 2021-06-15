class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :shirtnumber
      t.string :position
      t.string :name
      t.integer :player_rate
      t.string :rate_text
      t.integer :rate_id

      t.timestamps
    end
  end
end
