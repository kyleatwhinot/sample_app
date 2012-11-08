class AddDefaultToFollowedUp < ActiveRecord::Migration
  def up
  	change_column :asks, :followed_up, :boolean, :default => false
  end

  def down
  	change_column :asks, :followed_up, :boolean, :default => nil
  end
end
