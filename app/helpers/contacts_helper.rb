module ContactsHelper

  def overdue?(contact)
	@contact = contact
	@contact.due_at < Date.today 
  end
end
