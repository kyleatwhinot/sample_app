class Ask < ActiveRecord::Base

  attr_accessible :category, :description, :done, :followed_up, :helper, :public, :date_done, :date_followed_up, :user_id
  belongs_to :user
  has_many :messages
  default_scope order: 'asks.created_at ASC'

end
