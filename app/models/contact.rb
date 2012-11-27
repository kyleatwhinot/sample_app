class Contact < ActiveRecord::Base
  require 'chronic'

  before_save 	:parse_due_date
  attr_accessible :name, :done, :date_done, :date_followed_up, :due_at
  belongs_to :user, counter_cache: true
  has_many :outcomes
  validates :name, presence: true
  #default_scope order: 'contacts.created_at ASC'

  def parse_due_date
    self.due_at = Chronic::parse(self.name_before_type_cast) if attribute_present?("name")
  end

  def parse_due_date
    self.due_at = Chronic::parse(self.due_at_before_type_cast) if attribute_present?("due_at")
  end

  def overdue
    if self.due_at == nil
      return false
    else
      self.due_at < Time.now
    end
  end

  def no_due_date?
    if self.due_at == (nil || "")
      return true
    else
      return false
    end
  end




end
