class Message < ActiveRecord::Base
  attr_accessible :body
  belongs_to :ask

  validates :body, presence: true, length: { maximum: 500 }
end
