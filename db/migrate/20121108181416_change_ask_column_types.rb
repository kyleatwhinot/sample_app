class ChangeAskColumnTypes < ActiveRecord::Migration
  def up
  	change_column :asks, :helper, :string
  	change_column :asks, :category, :string
  	change_column :asks, :public, :boolean, :default => false
  end

  def down
  	change_column :asks, :helper, :integer
  	change_column :asks, :category, :integer
  	change_column :asks, :public, :boolean, :default => nil
  end
end
