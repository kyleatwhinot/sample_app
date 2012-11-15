class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :users, through: :memberships, dependent: :destroy
end
