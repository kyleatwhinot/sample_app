class AddTimeZoneAndPhone < ActiveRecord::Migration
  def up
  	add_column :users, :timezone, :integer, default: -5
  	add_column :users, :text_alerts, :boolean, default: true
  	add_column :users, :phone_number, :string
  end

  def down
  	remove_column :users, :timezone, :integer, default: -5
  	remove_column :users, :text_alerts, :boolean, default: true
  	remove_column :users, :phone_number, :string
  end
end
