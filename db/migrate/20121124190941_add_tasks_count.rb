class AddTasksCount < ActiveRecord::Migration
  def up
  	add_column :users, :contacts_count, :integer, default: 0
  	add_column :users, :asks_count, :integer, default: 0

  	User.reset_column_information
  	User.find(:all).each do |p|
    	User.update_counters p.id, :contacts_count => p.contacts.length
    	User.update_counters p.id, :asks_count => p.asks.length
  	end
  end

  def down
  	remove_column :users, :contacts_count
  	remove_column :users, :asks_count
  end
end
