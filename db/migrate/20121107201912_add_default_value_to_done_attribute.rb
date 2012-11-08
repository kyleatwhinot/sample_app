class AddDefaultValueToDoneAttribute < ActiveRecord::Migration
	def up
	    change_column :contacts, :done, :boolean, :default => false
	end

	def down
	    change_column :contacts, :done, :boolean, :default => nil
	end
end
