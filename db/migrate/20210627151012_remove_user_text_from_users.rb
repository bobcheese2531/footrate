class RemoveUserTextFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_text, :string
  end
end
