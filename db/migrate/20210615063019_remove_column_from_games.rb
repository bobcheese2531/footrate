class RemoveColumnFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :game_text, :text
    remove_column :games, :rate_team, :string
    remove_column :games, :youtube_url, :string
  end
end
