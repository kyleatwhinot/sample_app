class Contact < ActiveRecord::Base
  require 'chronic'

  before_save 	:parse_due_date
  attr_accessible :name, :done, :date_done, :date_followed_up, :due_at
  belongs_to :user
  validates :name, presence: true
  #default_scope order: 'contacts.created_at ASC'

  def parse_due_date
    self.due_at = Chronic::parse(self.name_before_type_cast) if attribute_present?("name")
  end

  def parse_due_date
    self.due_at = Chronic::parse(self.due_at_before_type_cast) if attribute_present?("due_at")
  end

  def overdue(contact)
    @contact = contact
    @contact.due_at < Date.today
  end

end
