class RemoveColumnFromRates < ActiveRecord::Migration[5.2]
  def change
    remove_column :rates, :position, :string
    remove_column :rates, :player_name, :string
    remove_column :rates, :player_rate, :integer
    remove_column :rates, :player_text, :string
  end
end
