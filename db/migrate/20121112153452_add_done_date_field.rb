class AddDoneDateField < ActiveRecord::Migration
  def up
  	add_column :contacts, :date_done, :date
  	add_column :contacts, :date_followed_up, :date
  end
  
end
