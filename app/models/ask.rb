class Ask < ActiveRecord::Base
  attr_accessible :category, :description, :done, :followed_up, :helper, :public, :date_done, :date_followed_up
  belongs_to :user

  default_scope order: 'asks.created_at ASC'
end
