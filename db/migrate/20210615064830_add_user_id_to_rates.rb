class AddUserIdToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :user_id, :integer
  end
end
