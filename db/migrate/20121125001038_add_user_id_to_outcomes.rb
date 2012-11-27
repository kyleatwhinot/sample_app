class AddUserIdToOutcomes < ActiveRecord::Migration
  def change
  	add_column :outcomes, :user_id, :integer
  end
end
