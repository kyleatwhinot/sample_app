class Ask < ActiveRecord::Base

  attr_accessible 	:category, :description, :done, :followed_up, 
  					:helper, :public, :date_done, :date_followed_up, :user_id, :outcomes_attributes
  belongs_to :user, counter_cache: true
  has_many :messages
  has_many :outcomes
  accepts_nested_attributes_for :outcomes
  default_scope order: 'asks.created_at ASC'
  scope :done, where(done: true)
  scope :not_followed_up, where(followed_up: false)
  scope :not_done, where(done: false)

  def self.done_ago(days)
  	d = days.to_i
  	where("date_done < ?", (Date.today - d.days))
  end


end
