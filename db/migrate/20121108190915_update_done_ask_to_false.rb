class UpdateDoneAskToFalse < ActiveRecord::Migration
  def up
  	change_column :asks, :done, :boolean, :default => false
  end

  def down
  	change_column :asks, :done, :boolean, :default => nil
  end
end
