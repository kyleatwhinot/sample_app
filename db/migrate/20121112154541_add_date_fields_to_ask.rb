class AddDateFieldsToAsk < ActiveRecord::Migration
  def up
  		add_column :asks, :date_done, :date
  		add_column :asks, :date_followed_up, :date
  end

  def down
  		remove_column :asks, :date_done, :date
  		remove_column :asks, :date_followed_up, :date
  end
end
