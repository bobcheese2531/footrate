class RemoveRateFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :rate_id, :bigint
  end
end
