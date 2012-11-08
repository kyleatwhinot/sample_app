require "spec_helper"

describe HelpOthersMailer do
  describe "i_can_help" do
    let(:mail) { HelpOthersMailer.i_can_help }

    it "renders the headers" do
      mail.subject.should eq("I can help")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
