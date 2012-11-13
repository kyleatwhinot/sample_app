class Contact < ActiveRecord::Base
  attr_accessible :name, :done, :date_done, :date_followed_up
  belongs_to :user

  validates :name, presence: true

  default_scope order: 'contacts.created_at ASC'


end
