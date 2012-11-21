class AddAskIdToMessages < ActiveRecord::Migration
  def change
   	add_column 	:messages, :ask_id, :integer
  end

  def down
  	remove_column 	:messages, :ask_id, :integer
  end
end
