class RemoveRateIdFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :rate_id, :integer
  end
end
