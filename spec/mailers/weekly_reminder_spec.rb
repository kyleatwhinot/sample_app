require "spec_helper"

describe WeeklyReminder do
  describe "ContactsAndAsks" do
    let(:mail) { WeeklyReminder.ContactsAndAsks }

    it "renders the headers" do
      mail.subject.should eq("Contactsandasks")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
