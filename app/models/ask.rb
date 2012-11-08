class Ask < ActiveRecord::Base
  attr_accessible :category, :description, :done, :followed_up, :helper, :public
  belongs_to :user

  default_scope order: 'asks.created_at ASC'
end
