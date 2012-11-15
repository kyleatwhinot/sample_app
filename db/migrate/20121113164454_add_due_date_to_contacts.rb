class AddDueDateToContacts < ActiveRecord::Migration
  def up
  	add_column :contacts, :due_at, :datetime
  end

  def down
  	remove_column :contacts, :due_at, :datetime
  end
end
