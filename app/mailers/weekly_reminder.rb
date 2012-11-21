class WeeklyReminder < ActionMailer::Base
  default from: "nice-work@whinot.com"

  def ContactsAndAsks(user, top3_contacts, top3_asks)
    @name = user.name
    @top3_contacts = top3_contacts
    @top3_asks = top3_asks

    mail to: user.email, subject: "Contact #{top3_contacts.to_sentence(last_word_connector:", or ")}"
  end
end
