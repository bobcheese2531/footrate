class AddReferencesToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :rate, null: false, foreign_key: true
  end
end
