class AddColumnToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :home_team, :string
    add_column :rates, :away_team, :string
  end
end
