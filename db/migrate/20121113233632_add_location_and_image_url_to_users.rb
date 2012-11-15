class AddLocationAndImageUrlToUsers < ActiveRecord::Migration
  def up
  	add_column 	:users, :location, :string
  	add_column 	:users, :image_url, :string
  end

  def down
  	remove_column 	:users, :location, :string
  	remove_column 	:users, :image_url, :string
  end
end
